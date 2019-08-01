#!/bin/python
#-----------------------------------------------------------------------------
# File Name : mnist_export.py
# Author: Emre Neftci
#
# Creation Date : Fri 07 Jun 2019 04:36:16 PM PDT
# Last Modified : 
#
# Copyright : (c) UC Regents, Emre Neftci
# Licence : GPLv2
#----------------------------------------------------------------------------- 
import tensorflow as tf
import tensorflow.contrib.slim as slim
from mnist import inputs, lenet

flags = tf.app.flags
flags.DEFINE_string('train_dir', '/tmp/data',
                    'Directory with the training data.')
flags.DEFINE_integer('batch_size', 5, 'Batch size.')
flags.DEFINE_integer('num_batches', None, 'Num of batches to train (epochs).')
flags.DEFINE_string('log_dir', './log/train',
                    'Directory with the log data.')
FLAGS = flags.FLAGS


if __name__ == '__main__':
    sess = tf.Session()
    images, labels = inputs(FLAGS.train_dir,
                            True,
                            FLAGS.batch_size,
                            FLAGS.num_batches,
                            one_hot_labels=True)
    predictions = tf.to_int32(tf.argmax(lenet(images),axis=1))
    init_op = tf.initialize_all_variables()
    sess.run(tf.global_variables_initializer())
    sess.run(init_op)

    # Choose the metrics to compute:
    #names_to_values, names_to_updates = slim.metrics.aggregate_metric_map({
    #    'accuracy': slim.metrics.accuracy(predictions, labels),
    #    'precision': slim.metrics.precision(predictions, labels),
    #'recall': slim.metrics.recall(mean_relative_errors, 0.3),})

    #num_examples = 10000
    #batch_size = flags.batch_size
    #num_batches = math.ceil(num_examples / float(batch_size))
    #slim.get_or_create_global_step()

    #output_dir = ... # Where the summaries are stored.
    #eval_interval_secs = ... # How often to run the evaluation.
    #slim.evaluation.evaluation_loop(
    #    'local',
    #    checkpoint_dir,
    #    log_dir,
    #    num_evals=num_batches,
    #    eval_op=names_to_updates.values(),
    #    summary_op=tf.summary.merge(summary_ops),
    #    eval_interval_secs=eval_interval_secs)
    new_saver = tf.train.Saver()
    new_saver.restore(sess, tf.train.latest_checkpoint('log/train/'))
    graph = tf.get_default_graph()
    tf.contrib.quantize.create_eval_graph()
    tf.train.write_graph(
          graph.as_graph_def(),
          'log',
          'mnist_frozen_graph.pbtxt',
          as_text=True)


