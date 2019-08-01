import tensorflow as tf
import tensorflow.contrib.slim as slim
from mnist import inputs, lenet
#from lenet import *

flags = tf.app.flags
flags.DEFINE_string('train_dir', '/tmp/data',
                    'Directory with the training data.')
flags.DEFINE_integer('batch_size', 128, 'Batch size.')
flags.DEFINE_integer('num_batches', None, 'Num of batches to train (epochs).')
flags.DEFINE_string('log_dir', './log/train',
                    'Directory with the log data.')
flags.DEFINE_string('fine_tune_checkpoint', '', 'Checkpoint from which to start finetuning.')
FLAGS = flags.FLAGS

def get_checkpoint_init_fn():
  """Returns the checkpoint init_fn if the checkpoint is provided."""
  if FLAGS.fine_tune_checkpoint:
    variables_to_restore = slim.get_variables_to_restore()
    global_step_reset = tf.assign(tf.train.get_or_create_global_step(), 0)
    # When restoring from a floating point model, the min/max values for
    # quantized weights and activations are not present.
    # We instruct slim to ignore variables that are missing during restoration
    # by setting ignore_missing_vars=True
    slim_init_fn = slim.assign_from_checkpoint_fn(
        FLAGS.fine_tune_checkpoint,
        variables_to_restore,
        ignore_missing_vars=True)

    def init_fn(sess):
      slim_init_fn(sess)
      # If we are restoring from a floating point model, we need to initialize
      # the global step to zero for the exponential decay to result in
      # reasonable learning rates.
      sess.run(global_step_reset)
    return init_fn
  else:
    return None

def build_model():
  with tf.Graph().as_default() as graph:
    images, labels = inputs(FLAGS.train_dir,
                            True,
                            FLAGS.batch_size,
                            FLAGS.num_batches,
                            one_hot_labels=True)
    #with slim.arg_scope(lenet_arg_scope()): 
    predictions, end_points = lenet(images, is_training=True)
    
    slim.losses.softmax_cross_entropy(predictions, labels)

    tf.contrib.quantize.create_training_graph(input_graph=graph, quant_delay=200)

    total_loss = slim.losses.get_total_loss()
    tf.summary.scalar('loss', total_loss)
    
    optimizer = tf.train.RMSPropOptimizer(0.001, 0.9)
    train_op = slim.learning.create_train_op(total_loss, optimizer, summarize_gradients=True)

    return graph, train_op


if __name__ == '__main__':

    with tf.Session() as sess:
      graph, train_op = build_model()
      
      slim.learning.train(
              train_op,
              graph = graph,
             # init_fn = get_checkpoint_init_fn(),
              logdir = 'logs',
              global_step=tf.train.get_global_step(),
              save_summaries_secs=100, save_interval_secs=100, number_of_steps=1000)

    
#    with tf.Graph().as_default() as graph_eval:
#      with tf.Session() as sess:
#        input_shape = [1, 32, 32, 1]
#        images = tf.placeholder(name='images', dtype=tf.float32,
#                               shape=input_shape)
#        predictions, end_points = lenet(images)
#        tf.contrib.quantize.create_eval_graph(input_graph=graph_eval)  
#        tf.global_variables_initializer()
#        with open('lomp', 'w') as f:
#              f.write(str(graph_eval.as_graph_def()))
#              saver = tf.train.Saver()
#              saver.save(sess, './hello')

