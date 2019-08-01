import numpy as np
import os
import traceback

class Trace(object):
    def __init__(self, params):
        self.times = []
        self.params = {}
        for p in params:
            self.params[p] = []
    def frame(self, t, **params):
        self.times.append(t)
        for p in self.params.keys():
            if p not in params:
                self.params[p].append(self.params[p][-1])
            else:
                self.params[p].append(params[p])

    def get(self, t, p):
        if t < self.times[0]:
            return None
        elif t > self.times[-1]:
            return None
        else:
            return np.interp([t], self.times, self.params[p])[0]


def load_trace(fn):
    if not os.path.isfile(fn):
        return None
    else:
        with open(fn) as f:
            code = f.read()
        locals = dict()
        globals = dict(Trace=Trace)
        try:
            exec(code, globals, locals)
        except:
            traceback.print_exc()
            return None
        for k, v in locals.items():
            if isinstance(v, Trace):
                return v
        else:
            return None

def extract_targets(filename, dt, t_start=None, t_end=None):
    trace = load_trace(filename+'.label')
    if t_end is None:        
        t_end = trace.times[-1] if trace is not None and len(trace.times)>0 else -1
    if t_start is None:
        t_start = 0
        
    times = []
    targets = []
    now = t_start
    while now < t_end:
        xx = trace.get(now, 'x')
        yy = trace.get(now, 'y')
        rr = trace.get(now, 'r')
        valid = 1 if xx is not None else 0
        if xx is None:
            xx = -1
        if yy is None:
            yy = -1
        if rr is None:
            rr = -1

        now += dt

        targets.append([xx, yy, rr, valid])
        times.append(now)

    targets = np.array(targets).reshape(-1, 4)
    times = np.array(times)
    
    return times, targets
        
    
    
def extract_images(filename,        # filename to load data from 
                   dt,              # time between images to create (seconds)
                   decay_time=0.1,  # spike decay time (seconds)
                   t_start=None,    # time to start generating images (seconds)
                   t_end=None,      # time to end generating images (seconds)
                   separate_channels=False, # separate the pos and neg channels
                   keep_pos=True,   # keep negative events
                   keep_neg=True,   # keep positive events
                   saturation=255,   # clip data to this limit
                   merge=1,         # merge pixels
                  ):

    if separate_channels:
        t_pos, images_pos = extract_images(filename, dt, decay_time,
                                           t_start, t_end, keep_neg=False,
                                           saturation=saturation, merge=merge)
        t_neg, images_neg = extract_images(filename, dt, decay_time,
                                           t_start, t_end, keep_pos=False,
                                           saturation=saturation, merge=merge)
        assert np.array_equal(t_pos, t_neg)
        return t_pos, images_pos, images_neg


#    fn = '%s_%g_%g_%g_%g_%g_%d%s%s.cache.npz' % (filename, dt, decay_time,
#                                              t_start, t_end,
#                                              saturation, merge,
#                                              '_pos' if keep_pos else '', 
#                                              '_neg' if keep_neg else '')
#    if os.path.exists(fn):
#        data = np.load(fn)
#        return data['times'], data['images']


    
    packet_size = 8

    with open(filename, 'rb') as f:
        data = f.read()
    data = np.fromstring(data, np.uint8)

    # find x and y values for events
    y = ((data[1::packet_size].astype('uint16')<<8) + data[::packet_size]) >> 2
    x = ((data[3::packet_size].astype('uint16')<<8) + data[2::packet_size]) >> 1
    # get the polarity (+1 for on events, -1 for off events)
    p = np.where((data[::packet_size] & 0x02) == 0x02,
                 1 if keep_pos else 0,
                 -1 if keep_neg else 0)
    v = np.where((data[::packet_size] & 0x01) == 0x01, 1, -1)
    # find the time stamp for each event, in seconds from the start of the file
    t = data[7::packet_size].astype(np.uint32)
    t = (t << 8) + data[6::packet_size]
    t = (t << 8) + data[5::packet_size]
    t = (t << 8) + data[4::packet_size]
    #t = t - t[0]
    t = t.astype(float) / 1000000   # convert microseconds to seconds

    if t_start is None:
        t_start = 0
    if t_end is None:
        t_end = t[-1]

    image = np.zeros((180, 240), dtype=float)

    images = []
    targets = []
    times = []
    event_index = 0   # for keeping track of where we are in the file
    if t_start > 0:
        event_index = np.searchsorted(t, t_start)

    now = t_start
    while now < t_end:
        decay_scale = np.exp(-dt/decay_time)#1-dt/(dt+decay_time)
        image *= decay_scale

        count = np.searchsorted(t[event_index:], now + dt)
        s = slice(event_index, event_index+count)
        ss = [p[s]!=0]
        dts = dt-(t[s][ss]-now)
        np.add.at(image, [y[s][ss], x[s][ss]], np.exp(-dts/decay_time))
        event_index += count
        image = np.clip(image, -saturation, saturation)

        now += dt

        merged_images = []
        for i in range(merge):
            for j in range(merge):
                merged_images.append(image[i::merge,j::merge])
                
        images.append(np.mean(merged_images, axis=0))
        
        times.append(now)
    images = np.array(images)
    images[images>5]=0 #kill hot pixels
    times = np.array(times)

    #np.savez(fn, times=times, images=images)
    
    return times, images


def load_data(filename, dt, decay_time,
              saturation=10, merge=1):
    times, targets = extract_targets(filename, dt=dt)
    index = 0
    while targets[index][3] == 0:
        index += 1
                
    times2, images_pos, images_neg = extract_images(filename,
                                 dt=dt, decay_time=decay_time,
                                 t_start=times[index]-2*dt, t_end=times[-1]-dt,
                                 separate_channels=True,
                                 saturation=saturation, merge=merge
                                 )
    times = times[index:]
    targets = targets[index:]
    if len(images_pos) > len(targets):
        assert len(images_pos) == len(targets) + 1
        images_pos = images_pos[:len(targets)]
    if len(images_neg) > len(targets):
        assert len(images_neg) == len(targets) + 1
        images_neg = images_neg[:len(targets)]

    assert len(times)==len(targets)
    assert len(targets)==len(images_pos)
    assert len(targets)==len(images_neg)

    return times, images_pos, images_neg, targets/merge

def load_frames(filename, merge=1):
    packet_size = 4+180*240*2

    with open(filename, 'rb') as f:
        data = f.read()
    data = np.fromstring(data, np.uint8)

    t = data[3::packet_size].astype(np.uint32)
    t = (t << 8) + data[2::packet_size]
    t = (t << 8) + data[1::packet_size]
    t = (t << 8) + data[0::packet_size]
    t = t.astype(float) / 1000000 
    images = []

    for index, tt in enumerate(t):
        d = data[index*packet_size+4:(index+1)*packet_size]
        high = d[1::2]
        low = d[0::2]
        v = high.astype(int)<<8 + low
        v = v.astype(float).reshape(180,240)/32768
        
        
        merged_images = []
        for i in range(merge):
            for j in range(merge):
                merged_images.append(v[i::merge,j::merge])
                
        images.append(np.mean(merged_images, axis=0))        
    return t, np.array(images)

from tensorflow.contrib.learn.python.learn.datasets import base
from tensorflow.python.framework import dtypes
from tensorflow.python.framework import random_seed
from tensorflow.python.platform import gfile
from tensorflow.python.util.deprecation import deprecated


class DataSet(object):
  """Container class for a dataset (deprecated).

  THIS CLASS IS DEPRECATED. See
  [contrib/learn/README.md](https://www.tensorflow.org/code/tensorflow/contrib/learn/README.md)
  for general migration instructions.
  """

  def __init__(self,
               images,
               labels,
               one_hot=False,
               fake_data=False,
               dtype=dtypes.float32,
               reshape=False,
               seed=None):
    """Construct a DataSet.
    one_hot arg is used only if fake_data is true.  `dtype` can be either
    `uint8` to leave the input as `[0, 255]`, or `float32` to rescale into
    `[0, 1]`.  Seed arg provides for convenient deterministic testing.
    """
    seed1, seed2 = random_seed.get_seed(seed)
    # If op level seed is not set, use whatever graph level seed is returned
    np.random.seed(seed1 if seed is None else seed2)
    dtype = dtypes.as_dtype(dtype).base_dtype
    if dtype not in (dtypes.uint8, dtypes.float32):
      raise TypeError(
          'Invalid image dtype %r, expected uint8 or float32' % dtype)
    if fake_data:
      self._num_examples = 10000
      self.one_hot = one_hot
    else:
      assert images.shape[0] == labels.shape[0], (
          'images.shape: %s labels.shape: %s' % (images.shape, labels.shape))
      self._num_examples = images.shape[0]

      # Convert shape from [num examples, rows, columns, depth]
      # to [num examples, rows*columns] (assuming depth == 1)
      if reshape:
        assert images.shape[3] == 2
        images = images.reshape(images.shape[0],
                                images.shape[1] * images.shape[2])
      if dtype == dtypes.float32:
        # Convert from [0, 255] -> [0.0, 1.0].
        images = images.astype(np.float32)
        #images = np.multiply(images, 1.0 / 255.0)
    self._images = images
    self._labels = labels
    self._epochs_completed = 0
    self._index_in_epoch = 0

  @property
  def images(self):
    return self._images

  @property
  def labels(self):
    return self._labels

  @property
  def num_examples(self):
    return self._num_examples

  @property
  def epochs_completed(self):
    return self._epochs_completed

  def next_batch(self, batch_size, fake_data=False, shuffle=True):
    """Return the next `batch_size` examples from this data set."""
    if fake_data:
      fake_image = [1] * 784
      if self.one_hot:
        fake_label = [1] + [0] * 9
      else:
        fake_label = 0
      return [fake_image for _ in xrange(batch_size)], [
          fake_label for _ in xrange(batch_size)
      ]
    start = self._index_in_epoch
    # Shuffle for the first epoch
    if self._epochs_completed == 0 and start == 0 and shuffle:
      perm0 = np.arange(self._num_examples)
      np.random.shuffle(perm0)
      self._images = self.images[perm0]
      self._labels = self.labels[perm0]
    # Go to the next epoch
    if start + batch_size > self._num_examples:
      # Finished epoch
      self._epochs_completed += 1
      # Get the rest examples in this epoch
      rest_num_examples = self._num_examples - start
      images_rest_part = self._images[start:self._num_examples]
      labels_rest_part = self._labels[start:self._num_examples]
      # Shuffle the data
      if shuffle:
        perm = np.arange(self._num_examples)
        np.random.shuffle(perm)
        self._images = self.images[perm]
        self._labels = self.labels[perm]
      # Start next epoch
      start = 0
      self._index_in_epoch = batch_size - rest_num_examples
      end = self._index_in_epoch
      images_new_part = self._images[start:end]
      labels_new_part = self._labels[start:end]
      return np.concatenate(
          (images_rest_part, images_new_part), axis=0), np.concatenate(
              (labels_rest_part, labels_new_part), axis=0)
    else:
      self._index_in_epoch += batch_size
      end = self._index_in_epoch
      return self._images[start:end], self._labels[start:end]



if __name__ == '__main__':
    directory = '/home/neuromorph/Downloads/ABR DAVIS Trajectory Dataset/'
    import glob
    fevs = glob.glob(directory+'*.events')
    flabs = glob.glob(directory+'*.events.label')
    images = []
    targ = []

    for f in fevs:
        print(f)
        times, images_pos, images_neg, targets = load_data(f,dt=.04,decay_time=0.01)
        images.append(np.array([images_neg, images_pos]).swapaxes(0,1).swapaxes(1,3).tolist())
        targ.append(targets)
    
    images = np.concatenate(images)*255
    num_examples = images.shape[0]
    targets = np.concatenate(targ).astype('float32')

    d1 = DataSet(images[int(num_examples*.8):],targets[int(num_examples*.8):])
    d2 = DataSet(images[:int(num_examples*.8)],targets[:int(num_examples*.8)])

    import pickle
    with open('f1.pkl','wb') as f:
        pickle.dump(d1, f)
    with open('f2.pkl','wb') as f:
        pickle.dump(d2, f)
