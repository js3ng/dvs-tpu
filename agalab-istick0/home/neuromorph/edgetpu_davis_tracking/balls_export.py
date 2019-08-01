r"""Saves out a GraphDef containing the architecture of the model.

To use it, run something like this, with a model name defined by slim:

bazel build tensorflow_models/research/slim:export_inference_graph
bazel-bin/tensorflow_models/research/slim/export_inference_graph \
--model_name=inception_v3 --output_file=/tmp/inception_v3_inf_graph.pb

If you then want to use the resulting model with your own or pretrained
checkpoints as part of a mobile model, you can run freeze_graph to get a graph
def with the variables inlined as constants using:

bazel build tensorflow/python/tools:freeze_graph
bazel-bin/tensorflow/python/tools/freeze_graph \
--input_graph=/tmp/inception_v3_inf_graph.pb \
--input_checkpoint=/tmp/checkpoints/inception_v3.ckpt \
--input_binary=true --output_graph=/tmp/frozen_inception_v3.pb \
--output_node_names=InceptionV3/Predictions/Reshape_1

The output node names will vary depending on the model, but you can inspect and
estimate them using the summarize_graph tool:

bazel build tensorflow/tools/graph_transforms:summarize_graph
bazel-bin/tensorflow/tools/graph_transforms/summarize_graph \
--in_graph=/tmp/inception_v3_inf_graph.pb

To run the resulting graph in C++, you can look at the label_image sample code:

bazel build tensorflow/examples/label_image:label_image
bazel-bin/tensorflow/examples/label_image/label_image \
--image=${HOME}/Pictures/flowers.jpg \
--input_layer=input \
--output_layer=InceptionV3/Predictions/Reshape_1 \
--graph=/tmp/frozen_inception_v3.pb \
--labels=/tmp/imagenet_slim_labels.txt \
--input_mean=0 \
--input_std=255

"""

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
import os
from data import inputs
from model import lenet
from tensorflow.python.tools import freeze_graph
from tensorflow.python.saved_model import tag_constants
from tensorflow.python.framework import graph_util
#from lenet import *
import tensorflow as tf
from keras.datasets import mnist
import numpy as np 
from balls_loader import DataSet
from tensorflow.python.platform import gfile


slim = tf.contrib.slim

tf.app.flags.DEFINE_string(
    'model_name', 'inception_v3', 'The name of the architecture to save.')

tf.app.flags.DEFINE_boolean(
    'is_training', False,
    'Whether to save out a training-focused version of the model.')

tf.app.flags.DEFINE_integer(
    'image_size', 90,
    'The image size to use, otherwise use the model default_image_size.')

tf.app.flags.DEFINE_integer(
    'channels', 2,
    'The number of channels to use (default=1).')



tf.app.flags.DEFINE_integer(
    'batch_size', None,
    'Batch size for the exported model. Defaulted to "None" so batch size can '
    'be specified at model runtime.')

tf.app.flags.DEFINE_string('dataset_name', 'imagenet',
                           'The name of the dataset to use with the model.')

tf.app.flags.DEFINE_integer(
    'labels_offset', 0,
    'An offset for the labels in the dataset. This flag is primarily used to '
    'evaluate the VGG and ResNet architectures which do not use a background '
    'class for the ImageNet dataset.')

tf.app.flags.DEFINE_string(
    'dataset_dir', '', 'Directory to save intermediate dataset files to')

tf.app.flags.DEFINE_bool(
    'quantize', False, 'whether to use quantized graph or not.')

tf.app.flags.DEFINE_bool(
    'is_video_model', False, 'whether to use 5-D inputs for video model.')

tf.app.flags.DEFINE_integer(
    'num_frames', None,
    'The number of frames to use. Only used if is_video_model is True.')

tf.app.flags.DEFINE_bool('write_text_graphdef', True,
                         'Whether to write a text version of graphdef.')

FLAGS = tf.app.flags.FLAGS

if __name__ == '__main__':
  if FLAGS.is_video_model and not FLAGS.num_frames:
    raise ValueError(
        'Number of frames must be specified for video models with --num_frames')

  data_sets = np.load('f2.pkl', allow_pickle=True)
  tf.logging.set_verbosity(tf.logging.INFO)
  with tf.Graph().as_default() as graph:
    with tf.Session(graph=graph) as sess:
      network_fn = lenet
      channels = FLAGS.channels
      input_shape = [FLAGS.batch_size, 240, 180, channels]
      images = tf.placeholder(name='images', dtype=tf.float32,
                                   shape=input_shape)
      labels = tf.placeholder(name='labels', dtype=tf.float32,
                                   shape=[FLAGS.batch_size,4])

      pred, endpoint = lenet(images, is_training=False)



      new_saver = tf.train.Saver()
      new_saver.restore(sess, tf.train.latest_checkpoint('./logs'))

      tf.contrib.quantize.create_eval_graph()


      graph_def = graph.as_graph_def()

      tf.train.write_graph(
          graph_def,
          './',
          'mnist.pb',
          as_text=True)

      im, la = data_sets.next_batch(128)

      np.save('hi', im)

#      print('Inputs: ', images, 'Outputs:', pred)
      print (pred.eval(session=sess, feed_dict={images:im.astype('uint8').astype('float32')}))
      loss = slim.losses.mean_squared_error(pred, labels)
      print("LOSS IS")
      print(loss.eval(session=sess,feed_dict={images:im, labels:la}))
#      print (pred.eval(session=sess, feed_dict={images:np.expand_dims(images_[:100],3)}).argmax(1))
#
#
#
    freeze_graph.freeze_graph(
     	input_graph='./mnist.pb',
     	output_graph='./frozen_mnist.pb',
     	#saved_model_tags = tag_constants.SERVING,
     	output_node_names="LeNet/fc4/BiasAdd",
     	initializer_nodes='',
     	input_binary=False,
     	input_saver=False,
     	input_checkpoint=tf.train.latest_checkpoint('./logs'),
     	restore_op_name=None,
     	filename_tensor_name=None,
     	clear_devices=False)


