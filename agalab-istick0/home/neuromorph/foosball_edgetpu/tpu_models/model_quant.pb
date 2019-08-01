node {
  name: "conv1_input"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 180
        }
        dim {
          size: 240
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.24618297815322876
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.24618297815322876
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv1/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv1/kernel/Initializer/random_uniform/max"
  input: "conv1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv1/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv1/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv1/kernel/Initializer/random_uniform/mul"
  input: "conv1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
}
node {
  name: "conv1/kernel"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv1/kernel"
    }
  }
}
node {
  name: "conv1/kernel/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv1/kernel"
}
node {
  name: "conv1/kernel/Assign"
  op: "AssignVariableOp"
  input: "conv1/kernel"
  input: "conv1/kernel/Initializer/random_uniform"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1/kernel/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/bias"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv1/bias"
    }
  }
}
node {
  name: "conv1/bias/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv1/bias"
}
node {
  name: "conv1/bias/Assign"
  op: "AssignVariableOp"
  input: "conv1/bias"
  input: "conv1/bias/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1/bias/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv1/Conv2D/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1/kernel"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1/Conv2D"
  op: "Conv2D"
  input: "conv1_input"
  input: "conv1/weights_quant/FakeQuantWithMinMaxVars"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/BiasAdd/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1/bias"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1/BiasAdd"
  op: "BiasAdd"
  input: "conv1/Conv2D"
  input: "conv1/BiasAdd/ReadVariableOp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv1/Relu"
  op: "Relu"
  input: "conv1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\n\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.18257418274879456
      }
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.18257418274879456
      }
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv2/kernel/Initializer/random_uniform/max"
  input: "conv2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv2/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv2/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
}
node {
  name: "conv2/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv2/kernel/Initializer/random_uniform/mul"
  input: "conv2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
}
node {
  name: "conv2/kernel"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv2/kernel"
    }
  }
}
node {
  name: "conv2/kernel/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv2/kernel"
}
node {
  name: "conv2/kernel/Assign"
  op: "AssignVariableOp"
  input: "conv2/kernel"
  input: "conv2/kernel/Initializer/random_uniform"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2/kernel/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2/bias"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv2/bias"
    }
  }
}
node {
  name: "conv2/bias/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv2/bias"
}
node {
  name: "conv2/bias/Assign"
  op: "AssignVariableOp"
  input: "conv2/bias"
  input: "conv2/bias/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2/bias/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2/Conv2D/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2/kernel"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2/Conv2D"
  op: "Conv2D"
  input: "conv1/act_quant/FakeQuantWithMinMaxVars"
  input: "conv2/weights_quant/FakeQuantWithMinMaxVars"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/BiasAdd/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2/bias"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2/BiasAdd"
  op: "BiasAdd"
  input: "conv2/Conv2D"
  input: "conv2/BiasAdd/ReadVariableOp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2/Relu"
  op: "Relu"
  input: "conv2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\n\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.24618297815322876
      }
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.24618297815322876
      }
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv3/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv3/kernel/Initializer/random_uniform/max"
  input: "conv3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv3/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv3/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
}
node {
  name: "conv3/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv3/kernel/Initializer/random_uniform/mul"
  input: "conv3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
}
node {
  name: "conv3/kernel"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv3/kernel"
    }
  }
}
node {
  name: "conv3/kernel/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv3/kernel"
}
node {
  name: "conv3/kernel/Assign"
  op: "AssignVariableOp"
  input: "conv3/kernel"
  input: "conv3/kernel/Initializer/random_uniform"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3/kernel/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3/bias"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv3/bias"
    }
  }
}
node {
  name: "conv3/bias/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv3/bias"
}
node {
  name: "conv3/bias/Assign"
  op: "AssignVariableOp"
  input: "conv3/bias"
  input: "conv3/bias/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3/bias/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv3/Conv2D/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3/kernel"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3/Conv2D"
  op: "Conv2D"
  input: "conv2/act_quant/FakeQuantWithMinMaxVars"
  input: "conv3/weights_quant/FakeQuantWithMinMaxVars"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/BiasAdd/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3/bias"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3/BiasAdd"
  op: "BiasAdd"
  input: "conv3/Conv2D"
  input: "conv3/BiasAdd/ReadVariableOp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv3/Relu"
  op: "Relu"
  input: "conv3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv3/kernel"
}
node {
  name: "VarIsInitializedOp_1"
  op: "VarIsInitializedOp"
  input: "conv2/bias"
}
node {
  name: "VarIsInitializedOp_2"
  op: "VarIsInitializedOp"
  input: "conv1/kernel"
}
node {
  name: "VarIsInitializedOp_3"
  op: "VarIsInitializedOp"
  input: "conv2/kernel"
}
node {
  name: "VarIsInitializedOp_4"
  op: "VarIsInitializedOp"
  input: "conv3/bias"
}
node {
  name: "VarIsInitializedOp_5"
  op: "VarIsInitializedOp"
  input: "conv1/bias"
}
node {
  name: "init"
  op: "NoOp"
  input: "^conv1/bias/Assign"
  input: "^conv1/kernel/Assign"
  input: "^conv2/bias/Assign"
  input: "^conv2/kernel/Assign"
  input: "^conv3/bias/Assign"
  input: "^conv3/kernel/Assign"
}
node {
  name: "Const"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2"
  op: "RestoreV2"
  input: "Const"
  input: "RestoreV2/tensor_names"
  input: "RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity"
  op: "Identity"
  input: "RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp"
  op: "AssignVariableOp"
  input: "conv1/kernel"
  input: "Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_1/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_1/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_1"
  op: "RestoreV2"
  input: "Const"
  input: "RestoreV2_1/tensor_names"
  input: "RestoreV2_1/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_1"
  op: "Identity"
  input: "RestoreV2_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_1"
  op: "AssignVariableOp"
  input: "conv1/bias"
  input: "Identity_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_2"
  op: "RestoreV2"
  input: "Const"
  input: "RestoreV2_2/tensor_names"
  input: "RestoreV2_2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_2"
  op: "Identity"
  input: "RestoreV2_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_2"
  op: "AssignVariableOp"
  input: "conv2/kernel"
  input: "Identity_2"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_3/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_3/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_3"
  op: "RestoreV2"
  input: "Const"
  input: "RestoreV2_3/tensor_names"
  input: "RestoreV2_3/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_3"
  op: "Identity"
  input: "RestoreV2_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_3"
  op: "AssignVariableOp"
  input: "conv2/bias"
  input: "Identity_3"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_4/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_4/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_4"
  op: "RestoreV2"
  input: "Const"
  input: "RestoreV2_4/tensor_names"
  input: "RestoreV2_4/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_4"
  op: "Identity"
  input: "RestoreV2_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_4"
  op: "AssignVariableOp"
  input: "conv3/kernel"
  input: "Identity_4"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_5/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_5/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_5"
  op: "RestoreV2"
  input: "Const"
  input: "RestoreV2_5/tensor_names"
  input: "RestoreV2_5/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_5"
  op: "Identity"
  input: "RestoreV2_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_5"
  op: "AssignVariableOp"
  input: "conv3/bias"
  input: "Identity_5"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_target"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: -1
        }
        dim {
          size: -1
        }
        dim {
          size: -1
        }
      }
    }
  }
}
node {
  name: "total/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@total"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "total"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@total"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "total"
    }
  }
}
node {
  name: "total/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "total"
}
node {
  name: "total/Assign"
  op: "AssignVariableOp"
  input: "total"
  input: "total/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@total"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "total/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "total"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@total"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "count/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@count"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "count"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@count"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "count"
    }
  }
}
node {
  name: "count/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "count"
}
node {
  name: "count/Assign"
  op: "AssignVariableOp"
  input: "count"
  input: "count/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@count"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "count/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "count"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@count"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/mean_squared_error/SquaredDifference"
  op: "SquaredDifference"
  input: "conv3/act_quant/FakeQuantWithMinMaxVars"
  input: "conv3_target"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/mean_squared_error/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "metrics/mean_squared_error/Mean"
  op: "Mean"
  input: "metrics/mean_squared_error/SquaredDifference"
  input: "metrics/mean_squared_error/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "metrics/mean_squared_error/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "metrics/mean_squared_error/Sum"
  op: "Sum"
  input: "metrics/mean_squared_error/Mean"
  input: "metrics/mean_squared_error/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "metrics/mean_squared_error/AssignAddVariableOp"
  op: "AssignAddVariableOp"
  input: "total"
  input: "metrics/mean_squared_error/Sum"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/mean_squared_error/ReadVariableOp"
  op: "ReadVariableOp"
  input: "total"
  input: "^metrics/mean_squared_error/AssignAddVariableOp"
  input: "^metrics/mean_squared_error/Sum"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/mean_squared_error/Size"
  op: "Size"
  input: "metrics/mean_squared_error/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "metrics/mean_squared_error/Cast"
  op: "Cast"
  input: "metrics/mean_squared_error/Size"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "metrics/mean_squared_error/AssignAddVariableOp_1"
  op: "AssignAddVariableOp"
  input: "count"
  input: "metrics/mean_squared_error/Cast"
  input: "^metrics/mean_squared_error/AssignAddVariableOp"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/mean_squared_error/ReadVariableOp_1"
  op: "ReadVariableOp"
  input: "count"
  input: "^metrics/mean_squared_error/AssignAddVariableOp"
  input: "^metrics/mean_squared_error/AssignAddVariableOp_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/mean_squared_error/div_no_nan/ReadVariableOp"
  op: "ReadVariableOp"
  input: "total"
  input: "^metrics/mean_squared_error/AssignAddVariableOp_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/mean_squared_error/div_no_nan/ReadVariableOp_1"
  op: "ReadVariableOp"
  input: "count"
  input: "^metrics/mean_squared_error/AssignAddVariableOp_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/mean_squared_error/div_no_nan"
  op: "DivNoNan"
  input: "metrics/mean_squared_error/div_no_nan/ReadVariableOp"
  input: "metrics/mean_squared_error/div_no_nan/ReadVariableOp_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/mean_squared_error/Identity"
  op: "Identity"
  input: "metrics/mean_squared_error/div_no_nan"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/conv3_loss/SquaredDifference"
  op: "SquaredDifference"
  input: "conv3/act_quant/FakeQuantWithMinMaxVars"
  input: "conv3_target"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/conv3_loss/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "loss/conv3_loss/Mean"
  op: "Mean"
  input: "loss/conv3_loss/SquaredDifference"
  input: "loss/conv3_loss/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/conv3_loss/weighted_loss/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/shape"
  op: "Shape"
  input: "loss/conv3_loss/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "loss/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  op: "NoOp"
}
node {
  name: "loss/conv3_loss/weighted_loss/broadcast_weights/ones_like/Shape"
  op: "Shape"
  input: "loss/conv3_loss/Mean"
  input: "^loss/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/conv3_loss/weighted_loss/broadcast_weights/ones_like/Const"
  op: "Const"
  input: "^loss/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/conv3_loss/weighted_loss/broadcast_weights/ones_like"
  op: "Fill"
  input: "loss/conv3_loss/weighted_loss/broadcast_weights/ones_like/Shape"
  input: "loss/conv3_loss/weighted_loss/broadcast_weights/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/conv3_loss/weighted_loss/broadcast_weights"
  op: "Mul"
  input: "loss/conv3_loss/weighted_loss/Const"
  input: "loss/conv3_loss/weighted_loss/broadcast_weights/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/conv3_loss/weighted_loss/Mul"
  op: "Mul"
  input: "loss/conv3_loss/Mean"
  input: "loss/conv3_loss/weighted_loss/broadcast_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/conv3_loss/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "loss/conv3_loss/Sum"
  op: "Sum"
  input: "loss/conv3_loss/weighted_loss/Mul"
  input: "loss/conv3_loss/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/conv3_loss/num_elements"
  op: "Size"
  input: "loss/conv3_loss/weighted_loss/Mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss/conv3_loss/num_elements/Cast"
  op: "Cast"
  input: "loss/conv3_loss/num_elements"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "loss/conv3_loss/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss/conv3_loss/Sum_1"
  op: "Sum"
  input: "loss/conv3_loss/Sum"
  input: "loss/conv3_loss/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/conv3_loss/value"
  op: "DivNoNan"
  input: "loss/conv3_loss/Sum_1"
  input: "loss/conv3_loss/num_elements/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/mul"
  op: "Mul"
  input: "loss/mul/x"
  input: "loss/conv3_loss/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1/weights_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/weights_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -6.0
      }
    }
  }
}
node {
  name: "conv1/weights_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/weights_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/weights_quant/min/Assign"
  op: "Assign"
  input: "conv1/weights_quant/min"
  input: "conv1/weights_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/weights_quant/min/read"
  op: "Identity"
  input: "conv1/weights_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/weights_quant/min"
      }
    }
  }
}
node {
  name: "conv1/weights_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/weights_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv1/weights_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/weights_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/weights_quant/max/Assign"
  op: "Assign"
  input: "conv1/weights_quant/max"
  input: "conv1/weights_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/weights_quant/max/read"
  op: "Identity"
  input: "conv1/weights_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/weights_quant/max"
      }
    }
  }
}
node {
  name: "conv1/weights_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv1/Conv2D/ReadVariableOp"
  input: "conv1/weights_quant/min/read"
  input: "conv1/weights_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: true
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv1/act_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/act_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1/act_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/act_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/act_quant/min/Assign"
  op: "Assign"
  input: "conv1/act_quant/min"
  input: "conv1/act_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/act_quant/min/read"
  op: "Identity"
  input: "conv1/act_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/act_quant/min"
      }
    }
  }
}
node {
  name: "conv1/act_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/act_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv1/act_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/act_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1/act_quant/max/Assign"
  op: "Assign"
  input: "conv1/act_quant/max"
  input: "conv1/act_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1/act_quant/max/read"
  op: "Identity"
  input: "conv1/act_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/act_quant/max"
      }
    }
  }
}
node {
  name: "conv1/act_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv1/Relu"
  input: "conv1/act_quant/min/read"
  input: "conv1/act_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: false
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv2/weights_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/weights_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -6.0
      }
    }
  }
}
node {
  name: "conv2/weights_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/weights_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/weights_quant/min/Assign"
  op: "Assign"
  input: "conv2/weights_quant/min"
  input: "conv2/weights_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/weights_quant/min/read"
  op: "Identity"
  input: "conv2/weights_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/weights_quant/min"
      }
    }
  }
}
node {
  name: "conv2/weights_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/weights_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv2/weights_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/weights_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/weights_quant/max/Assign"
  op: "Assign"
  input: "conv2/weights_quant/max"
  input: "conv2/weights_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/weights_quant/max/read"
  op: "Identity"
  input: "conv2/weights_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/weights_quant/max"
      }
    }
  }
}
node {
  name: "conv2/weights_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv2/Conv2D/ReadVariableOp"
  input: "conv2/weights_quant/min/read"
  input: "conv2/weights_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: true
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv2/act_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/act_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2/act_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/act_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/act_quant/min/Assign"
  op: "Assign"
  input: "conv2/act_quant/min"
  input: "conv2/act_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/act_quant/min/read"
  op: "Identity"
  input: "conv2/act_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/act_quant/min"
      }
    }
  }
}
node {
  name: "conv2/act_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/act_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv2/act_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/act_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2/act_quant/max/Assign"
  op: "Assign"
  input: "conv2/act_quant/max"
  input: "conv2/act_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2/act_quant/max/read"
  op: "Identity"
  input: "conv2/act_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/act_quant/max"
      }
    }
  }
}
node {
  name: "conv2/act_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv2/Relu"
  input: "conv2/act_quant/min/read"
  input: "conv2/act_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: false
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv3/weights_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/weights_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -6.0
      }
    }
  }
}
node {
  name: "conv3/weights_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/weights_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/weights_quant/min/Assign"
  op: "Assign"
  input: "conv3/weights_quant/min"
  input: "conv3/weights_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/weights_quant/min/read"
  op: "Identity"
  input: "conv3/weights_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/weights_quant/min"
      }
    }
  }
}
node {
  name: "conv3/weights_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/weights_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv3/weights_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/weights_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/weights_quant/max/Assign"
  op: "Assign"
  input: "conv3/weights_quant/max"
  input: "conv3/weights_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/weights_quant/max/read"
  op: "Identity"
  input: "conv3/weights_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/weights_quant/max"
      }
    }
  }
}
node {
  name: "conv3/weights_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv3/Conv2D/ReadVariableOp"
  input: "conv3/weights_quant/min/read"
  input: "conv3/weights_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: true
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv3/act_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/act_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3/act_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/act_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/act_quant/min/Assign"
  op: "Assign"
  input: "conv3/act_quant/min"
  input: "conv3/act_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/act_quant/min/read"
  op: "Identity"
  input: "conv3/act_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/act_quant/min"
      }
    }
  }
}
node {
  name: "conv3/act_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/act_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv3/act_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/act_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3/act_quant/max/Assign"
  op: "Assign"
  input: "conv3/act_quant/max"
  input: "conv3/act_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3/act_quant/max/read"
  op: "Identity"
  input: "conv3/act_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/act_quant/max"
      }
    }
  }
}
node {
  name: "conv3/act_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv3/Relu"
  input: "conv3/act_quant/min/read"
  input: "conv3/act_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: false
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "init_1"
  op: "NoOp"
  input: "^conv1/act_quant/max/Assign"
  input: "^conv1/act_quant/min/Assign"
  input: "^conv1/bias/Assign"
  input: "^conv1/kernel/Assign"
  input: "^conv1/weights_quant/max/Assign"
  input: "^conv1/weights_quant/min/Assign"
  input: "^conv2/act_quant/max/Assign"
  input: "^conv2/act_quant/min/Assign"
  input: "^conv2/bias/Assign"
  input: "^conv2/kernel/Assign"
  input: "^conv2/weights_quant/max/Assign"
  input: "^conv2/weights_quant/min/Assign"
  input: "^conv3/act_quant/max/Assign"
  input: "^conv3/act_quant/min/Assign"
  input: "^conv3/bias/Assign"
  input: "^conv3/kernel/Assign"
  input: "^conv3/weights_quant/max/Assign"
  input: "^conv3/weights_quant/min/Assign"
}
node {
  name: "save/filename/input"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/filename"
  op: "PlaceholderWithDefault"
  input: "save/filename/input"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save/Const"
  op: "PlaceholderWithDefault"
  input: "save/filename"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 18
          }
        }
        string_val: "conv1/act_quant/max"
        string_val: "conv1/act_quant/min"
        string_val: "conv1/bias"
        string_val: "conv1/kernel"
        string_val: "conv1/weights_quant/max"
        string_val: "conv1/weights_quant/min"
        string_val: "conv2/act_quant/max"
        string_val: "conv2/act_quant/min"
        string_val: "conv2/bias"
        string_val: "conv2/kernel"
        string_val: "conv2/weights_quant/max"
        string_val: "conv2/weights_quant/min"
        string_val: "conv3/act_quant/max"
        string_val: "conv3/act_quant/min"
        string_val: "conv3/bias"
        string_val: "conv3/kernel"
        string_val: "conv3/weights_quant/max"
        string_val: "conv3/weights_quant/min"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 18
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "conv1/act_quant/max"
  input: "conv1/act_quant/min"
  input: "conv1/bias/Read/ReadVariableOp"
  input: "conv1/kernel/Read/ReadVariableOp"
  input: "conv1/weights_quant/max"
  input: "conv1/weights_quant/min"
  input: "conv2/act_quant/max"
  input: "conv2/act_quant/min"
  input: "conv2/bias/Read/ReadVariableOp"
  input: "conv2/kernel/Read/ReadVariableOp"
  input: "conv2/weights_quant/max"
  input: "conv2/weights_quant/min"
  input: "conv3/act_quant/max"
  input: "conv3/act_quant/min"
  input: "conv3/bias/Read/ReadVariableOp"
  input: "conv3/kernel/Read/ReadVariableOp"
  input: "conv3/weights_quant/max"
  input: "conv3/weights_quant/min"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 18
          }
        }
        string_val: "conv1/act_quant/max"
        string_val: "conv1/act_quant/min"
        string_val: "conv1/bias"
        string_val: "conv1/kernel"
        string_val: "conv1/weights_quant/max"
        string_val: "conv1/weights_quant/min"
        string_val: "conv2/act_quant/max"
        string_val: "conv2/act_quant/min"
        string_val: "conv2/bias"
        string_val: "conv2/kernel"
        string_val: "conv2/weights_quant/max"
        string_val: "conv2/weights_quant/min"
        string_val: "conv3/act_quant/max"
        string_val: "conv3/act_quant/min"
        string_val: "conv3/bias"
        string_val: "conv3/kernel"
        string_val: "conv3/weights_quant/max"
        string_val: "conv3/weights_quant/min"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 18
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "conv1/act_quant/max"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "conv1/act_quant/min"
  input: "save/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Identity"
  op: "Identity"
  input: "save/RestoreV2:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/AssignVariableOp"
  op: "AssignVariableOp"
  input: "conv1/bias"
  input: "save/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/Identity_1"
  op: "Identity"
  input: "save/RestoreV2:3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/AssignVariableOp_1"
  op: "AssignVariableOp"
  input: "conv1/kernel"
  input: "save/Identity_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "conv1/weights_quant/max"
  input: "save/RestoreV2:4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "conv1/weights_quant/min"
  input: "save/RestoreV2:5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "conv2/act_quant/max"
  input: "save/RestoreV2:6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "conv2/act_quant/min"
  input: "save/RestoreV2:7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Identity_2"
  op: "Identity"
  input: "save/RestoreV2:8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/AssignVariableOp_2"
  op: "AssignVariableOp"
  input: "conv2/bias"
  input: "save/Identity_2"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/Identity_3"
  op: "Identity"
  input: "save/RestoreV2:9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/AssignVariableOp_3"
  op: "AssignVariableOp"
  input: "conv2/kernel"
  input: "save/Identity_3"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "conv2/weights_quant/max"
  input: "save/RestoreV2:10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "conv2/weights_quant/min"
  input: "save/RestoreV2:11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "conv3/act_quant/max"
  input: "save/RestoreV2:12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "conv3/act_quant/min"
  input: "save/RestoreV2:13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Identity_4"
  op: "Identity"
  input: "save/RestoreV2:14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/AssignVariableOp_4"
  op: "AssignVariableOp"
  input: "conv3/bias"
  input: "save/Identity_4"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/Identity_5"
  op: "Identity"
  input: "save/RestoreV2:15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/AssignVariableOp_5"
  op: "AssignVariableOp"
  input: "conv3/kernel"
  input: "save/Identity_5"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "conv3/weights_quant/max"
  input: "save/RestoreV2:16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "conv3/weights_quant/min"
  input: "save/RestoreV2:17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/AssignVariableOp"
  input: "^save/AssignVariableOp_1"
  input: "^save/AssignVariableOp_2"
  input: "^save/AssignVariableOp_3"
  input: "^save/AssignVariableOp_4"
  input: "^save/AssignVariableOp_5"
  input: "^save/Assign_1"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
}
node {
  name: "VarIsInitializedOp_6"
  op: "VarIsInitializedOp"
  input: "count"
}
node {
  name: "VarIsInitializedOp_7"
  op: "VarIsInitializedOp"
  input: "total"
}
node {
  name: "init_2"
  op: "NoOp"
  input: "^count/Assign"
  input: "^total/Assign"
}
node {
  name: "conv1_input_1"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 180
        }
        dim {
          size: 240
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv1_1/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "conv1_1/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.24618297815322876
      }
    }
  }
}
node {
  name: "conv1_1/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.24618297815322876
      }
    }
  }
}
node {
  name: "conv1_1/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv1_1/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv1_1/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv1_1/kernel/Initializer/random_uniform/max"
  input: "conv1_1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/kernel"
      }
    }
  }
}
node {
  name: "conv1_1/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv1_1/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv1_1/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/kernel"
      }
    }
  }
}
node {
  name: "conv1_1/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv1_1/kernel/Initializer/random_uniform/mul"
  input: "conv1_1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/kernel"
      }
    }
  }
}
node {
  name: "conv1_1/kernel"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv1_1/kernel"
    }
  }
}
node {
  name: "conv1_1/kernel/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv1_1/kernel"
}
node {
  name: "conv1_1/kernel/Assign"
  op: "AssignVariableOp"
  input: "conv1_1/kernel"
  input: "conv1_1/kernel/Initializer/random_uniform"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_1/kernel/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1_1/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1_1/bias"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv1_1/bias"
    }
  }
}
node {
  name: "conv1_1/bias/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv1_1/bias"
}
node {
  name: "conv1_1/bias/Assign"
  op: "AssignVariableOp"
  input: "conv1_1/bias"
  input: "conv1_1/bias/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_1/bias/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1_1/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv1_1/Conv2D/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1_1/kernel"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_1/Conv2D"
  op: "Conv2D"
  input: "conv1_input_1"
  input: "conv1_1/weights_quant/FakeQuantWithMinMaxVars"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_1/BiasAdd/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1_1/bias"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_1/BiasAdd"
  op: "BiasAdd"
  input: "conv1_1/Conv2D"
  input: "conv1_1/BiasAdd/ReadVariableOp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv1_1/Relu"
  op: "Relu"
  input: "conv1_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_1/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\n\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "conv2_1/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.18257418274879456
      }
    }
  }
}
node {
  name: "conv2_1/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.18257418274879456
      }
    }
  }
}
node {
  name: "conv2_1/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2_1/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv2_1/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv2_1/kernel/Initializer/random_uniform/max"
  input: "conv2_1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/kernel"
      }
    }
  }
}
node {
  name: "conv2_1/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv2_1/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv2_1/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/kernel"
      }
    }
  }
}
node {
  name: "conv2_1/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv2_1/kernel/Initializer/random_uniform/mul"
  input: "conv2_1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/kernel"
      }
    }
  }
}
node {
  name: "conv2_1/kernel"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv2_1/kernel"
    }
  }
}
node {
  name: "conv2_1/kernel/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv2_1/kernel"
}
node {
  name: "conv2_1/kernel/Assign"
  op: "AssignVariableOp"
  input: "conv2_1/kernel"
  input: "conv2_1/kernel/Initializer/random_uniform"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_1/kernel/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2_1/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2_1/bias"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv2_1/bias"
    }
  }
}
node {
  name: "conv2_1/bias/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv2_1/bias"
}
node {
  name: "conv2_1/bias/Assign"
  op: "AssignVariableOp"
  input: "conv2_1/bias"
  input: "conv2_1/bias/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_1/bias/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2_1/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2_1/Conv2D/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2_1/kernel"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_1/Conv2D"
  op: "Conv2D"
  input: "conv1_1/act_quant/FakeQuantWithMinMaxVars"
  input: "conv2_1/weights_quant/FakeQuantWithMinMaxVars"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_1/BiasAdd/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2_1/bias"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_1/BiasAdd"
  op: "BiasAdd"
  input: "conv2_1/Conv2D"
  input: "conv2_1/BiasAdd/ReadVariableOp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2_1/Relu"
  op: "Relu"
  input: "conv2_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_1/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\n\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv3_1/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.24618297815322876
      }
    }
  }
}
node {
  name: "conv3_1/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.24618297815322876
      }
    }
  }
}
node {
  name: "conv3_1/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv3_1/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv3_1/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv3_1/kernel/Initializer/random_uniform/max"
  input: "conv3_1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/kernel"
      }
    }
  }
}
node {
  name: "conv3_1/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv3_1/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv3_1/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/kernel"
      }
    }
  }
}
node {
  name: "conv3_1/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv3_1/kernel/Initializer/random_uniform/mul"
  input: "conv3_1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/kernel"
      }
    }
  }
}
node {
  name: "conv3_1/kernel"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv3_1/kernel"
    }
  }
}
node {
  name: "conv3_1/kernel/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv3_1/kernel"
}
node {
  name: "conv3_1/kernel/Assign"
  op: "AssignVariableOp"
  input: "conv3_1/kernel"
  input: "conv3_1/kernel/Initializer/random_uniform"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_1/kernel/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3_1/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3_1/bias"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv3_1/bias"
    }
  }
}
node {
  name: "conv3_1/bias/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv3_1/bias"
}
node {
  name: "conv3_1/bias/Assign"
  op: "AssignVariableOp"
  input: "conv3_1/bias"
  input: "conv3_1/bias/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_1/bias/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3_1/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv3_1/Conv2D/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3_1/kernel"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_1/Conv2D"
  op: "Conv2D"
  input: "conv2_1/act_quant/FakeQuantWithMinMaxVars"
  input: "conv3_1/weights_quant/FakeQuantWithMinMaxVars"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_1/BiasAdd/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3_1/bias"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_1/BiasAdd"
  op: "BiasAdd"
  input: "conv3_1/Conv2D"
  input: "conv3_1/BiasAdd/ReadVariableOp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv3_1/Relu"
  op: "Relu"
  input: "conv3_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "VarIsInitializedOp_8"
  op: "VarIsInitializedOp"
  input: "conv1_1/kernel"
}
node {
  name: "VarIsInitializedOp_9"
  op: "VarIsInitializedOp"
  input: "conv2_1/kernel"
}
node {
  name: "VarIsInitializedOp_10"
  op: "VarIsInitializedOp"
  input: "conv3_1/kernel"
}
node {
  name: "VarIsInitializedOp_11"
  op: "VarIsInitializedOp"
  input: "conv3_1/bias"
}
node {
  name: "VarIsInitializedOp_12"
  op: "VarIsInitializedOp"
  input: "conv2_1/bias"
}
node {
  name: "VarIsInitializedOp_13"
  op: "VarIsInitializedOp"
  input: "conv1_1/bias"
}
node {
  name: "init_3"
  op: "NoOp"
  input: "^conv1_1/bias/Assign"
  input: "^conv1_1/kernel/Assign"
  input: "^conv2_1/bias/Assign"
  input: "^conv2_1/kernel/Assign"
  input: "^conv3_1/bias/Assign"
  input: "^conv3_1/kernel/Assign"
}
node {
  name: "Const_1"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "RestoreV2_6/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_6/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_6"
  op: "RestoreV2"
  input: "Const_1"
  input: "RestoreV2_6/tensor_names"
  input: "RestoreV2_6/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_6"
  op: "Identity"
  input: "RestoreV2_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_6"
  op: "AssignVariableOp"
  input: "conv1_1/kernel"
  input: "Identity_6"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_7/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_7/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_7"
  op: "RestoreV2"
  input: "Const_1"
  input: "RestoreV2_7/tensor_names"
  input: "RestoreV2_7/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_7"
  op: "Identity"
  input: "RestoreV2_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_7"
  op: "AssignVariableOp"
  input: "conv1_1/bias"
  input: "Identity_7"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_8/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_8/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_8"
  op: "RestoreV2"
  input: "Const_1"
  input: "RestoreV2_8/tensor_names"
  input: "RestoreV2_8/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_8"
  op: "Identity"
  input: "RestoreV2_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_8"
  op: "AssignVariableOp"
  input: "conv2_1/kernel"
  input: "Identity_8"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_9/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_9/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_9"
  op: "RestoreV2"
  input: "Const_1"
  input: "RestoreV2_9/tensor_names"
  input: "RestoreV2_9/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_9"
  op: "Identity"
  input: "RestoreV2_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_9"
  op: "AssignVariableOp"
  input: "conv2_1/bias"
  input: "Identity_9"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_10/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_10/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_10"
  op: "RestoreV2"
  input: "Const_1"
  input: "RestoreV2_10/tensor_names"
  input: "RestoreV2_10/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_10"
  op: "Identity"
  input: "RestoreV2_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_10"
  op: "AssignVariableOp"
  input: "conv3_1/kernel"
  input: "Identity_10"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_11/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_11/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_11"
  op: "RestoreV2"
  input: "Const_1"
  input: "RestoreV2_11/tensor_names"
  input: "RestoreV2_11/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_11"
  op: "Identity"
  input: "RestoreV2_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_11"
  op: "AssignVariableOp"
  input: "conv3_1/bias"
  input: "Identity_11"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "inputs"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 180
        }
        dim {
          size: 240
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv3_target_1"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: -1
        }
        dim {
          size: -1
        }
        dim {
          size: -1
        }
      }
    }
  }
}
node {
  name: "total_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@total_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "total_1"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@total_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "total_1"
    }
  }
}
node {
  name: "total_1/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "total_1"
}
node {
  name: "total_1/Assign"
  op: "AssignVariableOp"
  input: "total_1"
  input: "total_1/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@total_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "total_1/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "total_1"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@total_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "count_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@count_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "count_1"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@count_1"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "count_1"
    }
  }
}
node {
  name: "count_1/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "count_1"
}
node {
  name: "count_1/Assign"
  op: "AssignVariableOp"
  input: "count_1"
  input: "count_1/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@count_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "count_1/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "count_1"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@count_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/SquaredDifference"
  op: "SquaredDifference"
  input: "conv3_1/act_quant/FakeQuantWithMinMaxVars"
  input: "conv3_target_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/Mean"
  op: "Mean"
  input: "metrics_2/mean_squared_error/SquaredDifference"
  input: "metrics_2/mean_squared_error/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/Sum"
  op: "Sum"
  input: "metrics_2/mean_squared_error/Mean"
  input: "metrics_2/mean_squared_error/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/AssignAddVariableOp"
  op: "AssignAddVariableOp"
  input: "total_1"
  input: "metrics_2/mean_squared_error/Sum"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/ReadVariableOp"
  op: "ReadVariableOp"
  input: "total_1"
  input: "^metrics_2/mean_squared_error/AssignAddVariableOp"
  input: "^metrics_2/mean_squared_error/Sum"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/Size"
  op: "Size"
  input: "metrics_2/mean_squared_error/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/Cast"
  op: "Cast"
  input: "metrics_2/mean_squared_error/Size"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/AssignAddVariableOp_1"
  op: "AssignAddVariableOp"
  input: "count_1"
  input: "metrics_2/mean_squared_error/Cast"
  input: "^metrics_2/mean_squared_error/AssignAddVariableOp"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/ReadVariableOp_1"
  op: "ReadVariableOp"
  input: "count_1"
  input: "^metrics_2/mean_squared_error/AssignAddVariableOp"
  input: "^metrics_2/mean_squared_error/AssignAddVariableOp_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/div_no_nan/ReadVariableOp"
  op: "ReadVariableOp"
  input: "total_1"
  input: "^metrics_2/mean_squared_error/AssignAddVariableOp_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/div_no_nan/ReadVariableOp_1"
  op: "ReadVariableOp"
  input: "count_1"
  input: "^metrics_2/mean_squared_error/AssignAddVariableOp_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/div_no_nan"
  op: "DivNoNan"
  input: "metrics_2/mean_squared_error/div_no_nan/ReadVariableOp"
  input: "metrics_2/mean_squared_error/div_no_nan/ReadVariableOp_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_2/mean_squared_error/Identity"
  op: "Identity"
  input: "metrics_2/mean_squared_error/div_no_nan"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_1/conv3_loss/SquaredDifference"
  op: "SquaredDifference"
  input: "conv3_1/act_quant/FakeQuantWithMinMaxVars"
  input: "conv3_target_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_1/conv3_loss/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "loss_1/conv3_loss/Mean"
  op: "Mean"
  input: "loss_1/conv3_loss/SquaredDifference"
  input: "loss_1/conv3_loss/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss_1/conv3_loss/weighted_loss/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss_1/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss_1/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss_1/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/shape"
  op: "Shape"
  input: "loss_1/conv3_loss/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss_1/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "loss_1/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  op: "NoOp"
}
node {
  name: "loss_1/conv3_loss/weighted_loss/broadcast_weights/ones_like/Shape"
  op: "Shape"
  input: "loss_1/conv3_loss/Mean"
  input: "^loss_1/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss_1/conv3_loss/weighted_loss/broadcast_weights/ones_like/Const"
  op: "Const"
  input: "^loss_1/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss_1/conv3_loss/weighted_loss/broadcast_weights/ones_like"
  op: "Fill"
  input: "loss_1/conv3_loss/weighted_loss/broadcast_weights/ones_like/Shape"
  input: "loss_1/conv3_loss/weighted_loss/broadcast_weights/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss_1/conv3_loss/weighted_loss/broadcast_weights"
  op: "Mul"
  input: "loss_1/conv3_loss/weighted_loss/Const"
  input: "loss_1/conv3_loss/weighted_loss/broadcast_weights/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_1/conv3_loss/weighted_loss/Mul"
  op: "Mul"
  input: "loss_1/conv3_loss/Mean"
  input: "loss_1/conv3_loss/weighted_loss/broadcast_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_1/conv3_loss/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "loss_1/conv3_loss/Sum"
  op: "Sum"
  input: "loss_1/conv3_loss/weighted_loss/Mul"
  input: "loss_1/conv3_loss/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss_1/conv3_loss/num_elements"
  op: "Size"
  input: "loss_1/conv3_loss/weighted_loss/Mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss_1/conv3_loss/num_elements/Cast"
  op: "Cast"
  input: "loss_1/conv3_loss/num_elements"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "loss_1/conv3_loss/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss_1/conv3_loss/Sum_1"
  op: "Sum"
  input: "loss_1/conv3_loss/Sum"
  input: "loss_1/conv3_loss/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss_1/conv3_loss/value"
  op: "DivNoNan"
  input: "loss_1/conv3_loss/Sum_1"
  input: "loss_1/conv3_loss/num_elements/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_1/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss_1/mul"
  op: "Mul"
  input: "loss_1/mul/x"
  input: "loss_1/conv3_loss/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_1/weights_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/weights_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -6.0
      }
    }
  }
}
node {
  name: "conv1_1/weights_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/weights_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1_1/weights_quant/min/Assign"
  op: "Assign"
  input: "conv1_1/weights_quant/min"
  input: "conv1_1/weights_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_1/weights_quant/min/read"
  op: "Identity"
  input: "conv1_1/weights_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/weights_quant/min"
      }
    }
  }
}
node {
  name: "conv1_1/weights_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/weights_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv1_1/weights_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/weights_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1_1/weights_quant/max/Assign"
  op: "Assign"
  input: "conv1_1/weights_quant/max"
  input: "conv1_1/weights_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_1/weights_quant/max/read"
  op: "Identity"
  input: "conv1_1/weights_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/weights_quant/max"
      }
    }
  }
}
node {
  name: "conv1_1/weights_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv1_1/Conv2D/ReadVariableOp"
  input: "conv1_1/weights_quant/min/read"
  input: "conv1_1/weights_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: true
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv1_1/act_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/act_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1_1/act_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/act_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1_1/act_quant/min/Assign"
  op: "Assign"
  input: "conv1_1/act_quant/min"
  input: "conv1_1/act_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_1/act_quant/min/read"
  op: "Identity"
  input: "conv1_1/act_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/act_quant/min"
      }
    }
  }
}
node {
  name: "conv1_1/act_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/act_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv1_1/act_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/act_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1_1/act_quant/max/Assign"
  op: "Assign"
  input: "conv1_1/act_quant/max"
  input: "conv1_1/act_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_1/act_quant/max/read"
  op: "Identity"
  input: "conv1_1/act_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/act_quant/max"
      }
    }
  }
}
node {
  name: "conv1_1/act_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv1_1/Relu"
  input: "conv1_1/act_quant/min/read"
  input: "conv1_1/act_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: false
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv2_1/weights_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/weights_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -6.0
      }
    }
  }
}
node {
  name: "conv2_1/weights_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/weights_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2_1/weights_quant/min/Assign"
  op: "Assign"
  input: "conv2_1/weights_quant/min"
  input: "conv2_1/weights_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_1/weights_quant/min/read"
  op: "Identity"
  input: "conv2_1/weights_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/weights_quant/min"
      }
    }
  }
}
node {
  name: "conv2_1/weights_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/weights_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv2_1/weights_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/weights_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2_1/weights_quant/max/Assign"
  op: "Assign"
  input: "conv2_1/weights_quant/max"
  input: "conv2_1/weights_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_1/weights_quant/max/read"
  op: "Identity"
  input: "conv2_1/weights_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/weights_quant/max"
      }
    }
  }
}
node {
  name: "conv2_1/weights_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv2_1/Conv2D/ReadVariableOp"
  input: "conv2_1/weights_quant/min/read"
  input: "conv2_1/weights_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: true
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv2_1/act_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/act_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2_1/act_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/act_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2_1/act_quant/min/Assign"
  op: "Assign"
  input: "conv2_1/act_quant/min"
  input: "conv2_1/act_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_1/act_quant/min/read"
  op: "Identity"
  input: "conv2_1/act_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/act_quant/min"
      }
    }
  }
}
node {
  name: "conv2_1/act_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/act_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv2_1/act_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/act_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2_1/act_quant/max/Assign"
  op: "Assign"
  input: "conv2_1/act_quant/max"
  input: "conv2_1/act_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_1/act_quant/max/read"
  op: "Identity"
  input: "conv2_1/act_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/act_quant/max"
      }
    }
  }
}
node {
  name: "conv2_1/act_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv2_1/Relu"
  input: "conv2_1/act_quant/min/read"
  input: "conv2_1/act_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: false
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv3_1/weights_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/weights_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -6.0
      }
    }
  }
}
node {
  name: "conv3_1/weights_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/weights_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3_1/weights_quant/min/Assign"
  op: "Assign"
  input: "conv3_1/weights_quant/min"
  input: "conv3_1/weights_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_1/weights_quant/min/read"
  op: "Identity"
  input: "conv3_1/weights_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/weights_quant/min"
      }
    }
  }
}
node {
  name: "conv3_1/weights_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/weights_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv3_1/weights_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/weights_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3_1/weights_quant/max/Assign"
  op: "Assign"
  input: "conv3_1/weights_quant/max"
  input: "conv3_1/weights_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_1/weights_quant/max/read"
  op: "Identity"
  input: "conv3_1/weights_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/weights_quant/max"
      }
    }
  }
}
node {
  name: "conv3_1/weights_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv3_1/Conv2D/ReadVariableOp"
  input: "conv3_1/weights_quant/min/read"
  input: "conv3_1/weights_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: true
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv3_1/act_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/act_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3_1/act_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/act_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3_1/act_quant/min/Assign"
  op: "Assign"
  input: "conv3_1/act_quant/min"
  input: "conv3_1/act_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_1/act_quant/min/read"
  op: "Identity"
  input: "conv3_1/act_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/act_quant/min"
      }
    }
  }
}
node {
  name: "conv3_1/act_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/act_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv3_1/act_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/act_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3_1/act_quant/max/Assign"
  op: "Assign"
  input: "conv3_1/act_quant/max"
  input: "conv3_1/act_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_1/act_quant/max/read"
  op: "Identity"
  input: "conv3_1/act_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/act_quant/max"
      }
    }
  }
}
node {
  name: "conv3_1/act_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv3_1/Relu"
  input: "conv3_1/act_quant/min/read"
  input: "conv3_1/act_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: false
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "init_4"
  op: "NoOp"
  input: "^conv1/act_quant/max/Assign"
  input: "^conv1/act_quant/min/Assign"
  input: "^conv1/bias/Assign"
  input: "^conv1/kernel/Assign"
  input: "^conv1/weights_quant/max/Assign"
  input: "^conv1/weights_quant/min/Assign"
  input: "^conv1_1/act_quant/max/Assign"
  input: "^conv1_1/act_quant/min/Assign"
  input: "^conv1_1/bias/Assign"
  input: "^conv1_1/kernel/Assign"
  input: "^conv1_1/weights_quant/max/Assign"
  input: "^conv1_1/weights_quant/min/Assign"
  input: "^conv2/act_quant/max/Assign"
  input: "^conv2/act_quant/min/Assign"
  input: "^conv2/bias/Assign"
  input: "^conv2/kernel/Assign"
  input: "^conv2/weights_quant/max/Assign"
  input: "^conv2/weights_quant/min/Assign"
  input: "^conv2_1/act_quant/max/Assign"
  input: "^conv2_1/act_quant/min/Assign"
  input: "^conv2_1/bias/Assign"
  input: "^conv2_1/kernel/Assign"
  input: "^conv2_1/weights_quant/max/Assign"
  input: "^conv2_1/weights_quant/min/Assign"
  input: "^conv3/act_quant/max/Assign"
  input: "^conv3/act_quant/min/Assign"
  input: "^conv3/bias/Assign"
  input: "^conv3/kernel/Assign"
  input: "^conv3/weights_quant/max/Assign"
  input: "^conv3/weights_quant/min/Assign"
  input: "^conv3_1/act_quant/max/Assign"
  input: "^conv3_1/act_quant/min/Assign"
  input: "^conv3_1/bias/Assign"
  input: "^conv3_1/kernel/Assign"
  input: "^conv3_1/weights_quant/max/Assign"
  input: "^conv3_1/weights_quant/min/Assign"
}
node {
  name: "save_1/filename/input"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save_1/filename"
  op: "PlaceholderWithDefault"
  input: "save_1/filename/input"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save_1/Const"
  op: "PlaceholderWithDefault"
  input: "save_1/filename"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save_1/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 36
          }
        }
        string_val: "conv1/act_quant/max"
        string_val: "conv1/act_quant/min"
        string_val: "conv1/bias"
        string_val: "conv1/kernel"
        string_val: "conv1/weights_quant/max"
        string_val: "conv1/weights_quant/min"
        string_val: "conv1_1/act_quant/max"
        string_val: "conv1_1/act_quant/min"
        string_val: "conv1_1/bias"
        string_val: "conv1_1/kernel"
        string_val: "conv1_1/weights_quant/max"
        string_val: "conv1_1/weights_quant/min"
        string_val: "conv2/act_quant/max"
        string_val: "conv2/act_quant/min"
        string_val: "conv2/bias"
        string_val: "conv2/kernel"
        string_val: "conv2/weights_quant/max"
        string_val: "conv2/weights_quant/min"
        string_val: "conv2_1/act_quant/max"
        string_val: "conv2_1/act_quant/min"
        string_val: "conv2_1/bias"
        string_val: "conv2_1/kernel"
        string_val: "conv2_1/weights_quant/max"
        string_val: "conv2_1/weights_quant/min"
        string_val: "conv3/act_quant/max"
        string_val: "conv3/act_quant/min"
        string_val: "conv3/bias"
        string_val: "conv3/kernel"
        string_val: "conv3/weights_quant/max"
        string_val: "conv3/weights_quant/min"
        string_val: "conv3_1/act_quant/max"
        string_val: "conv3_1/act_quant/min"
        string_val: "conv3_1/bias"
        string_val: "conv3_1/kernel"
        string_val: "conv3_1/weights_quant/max"
        string_val: "conv3_1/weights_quant/min"
      }
    }
  }
}
node {
  name: "save_1/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 36
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save_1/SaveV2"
  op: "SaveV2"
  input: "save_1/Const"
  input: "save_1/SaveV2/tensor_names"
  input: "save_1/SaveV2/shape_and_slices"
  input: "conv1/act_quant/max"
  input: "conv1/act_quant/min"
  input: "conv1/bias/Read/ReadVariableOp"
  input: "conv1/kernel/Read/ReadVariableOp"
  input: "conv1/weights_quant/max"
  input: "conv1/weights_quant/min"
  input: "conv1_1/act_quant/max"
  input: "conv1_1/act_quant/min"
  input: "conv1_1/bias/Read/ReadVariableOp"
  input: "conv1_1/kernel/Read/ReadVariableOp"
  input: "conv1_1/weights_quant/max"
  input: "conv1_1/weights_quant/min"
  input: "conv2/act_quant/max"
  input: "conv2/act_quant/min"
  input: "conv2/bias/Read/ReadVariableOp"
  input: "conv2/kernel/Read/ReadVariableOp"
  input: "conv2/weights_quant/max"
  input: "conv2/weights_quant/min"
  input: "conv2_1/act_quant/max"
  input: "conv2_1/act_quant/min"
  input: "conv2_1/bias/Read/ReadVariableOp"
  input: "conv2_1/kernel/Read/ReadVariableOp"
  input: "conv2_1/weights_quant/max"
  input: "conv2_1/weights_quant/min"
  input: "conv3/act_quant/max"
  input: "conv3/act_quant/min"
  input: "conv3/bias/Read/ReadVariableOp"
  input: "conv3/kernel/Read/ReadVariableOp"
  input: "conv3/weights_quant/max"
  input: "conv3/weights_quant/min"
  input: "conv3_1/act_quant/max"
  input: "conv3_1/act_quant/min"
  input: "conv3_1/bias/Read/ReadVariableOp"
  input: "conv3_1/kernel/Read/ReadVariableOp"
  input: "conv3_1/weights_quant/max"
  input: "conv3_1/weights_quant/min"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save_1/control_dependency"
  op: "Identity"
  input: "save_1/Const"
  input: "^save_1/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save_1/Const"
      }
    }
  }
}
node {
  name: "save_1/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 36
          }
        }
        string_val: "conv1/act_quant/max"
        string_val: "conv1/act_quant/min"
        string_val: "conv1/bias"
        string_val: "conv1/kernel"
        string_val: "conv1/weights_quant/max"
        string_val: "conv1/weights_quant/min"
        string_val: "conv1_1/act_quant/max"
        string_val: "conv1_1/act_quant/min"
        string_val: "conv1_1/bias"
        string_val: "conv1_1/kernel"
        string_val: "conv1_1/weights_quant/max"
        string_val: "conv1_1/weights_quant/min"
        string_val: "conv2/act_quant/max"
        string_val: "conv2/act_quant/min"
        string_val: "conv2/bias"
        string_val: "conv2/kernel"
        string_val: "conv2/weights_quant/max"
        string_val: "conv2/weights_quant/min"
        string_val: "conv2_1/act_quant/max"
        string_val: "conv2_1/act_quant/min"
        string_val: "conv2_1/bias"
        string_val: "conv2_1/kernel"
        string_val: "conv2_1/weights_quant/max"
        string_val: "conv2_1/weights_quant/min"
        string_val: "conv3/act_quant/max"
        string_val: "conv3/act_quant/min"
        string_val: "conv3/bias"
        string_val: "conv3/kernel"
        string_val: "conv3/weights_quant/max"
        string_val: "conv3/weights_quant/min"
        string_val: "conv3_1/act_quant/max"
        string_val: "conv3_1/act_quant/min"
        string_val: "conv3_1/bias"
        string_val: "conv3_1/kernel"
        string_val: "conv3_1/weights_quant/max"
        string_val: "conv3_1/weights_quant/min"
      }
    }
  }
}
node {
  name: "save_1/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 36
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save_1/RestoreV2"
  op: "RestoreV2"
  input: "save_1/Const"
  input: "save_1/RestoreV2/tensor_names"
  input: "save_1/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save_1/Assign"
  op: "Assign"
  input: "conv1/act_quant/max"
  input: "save_1/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_1"
  op: "Assign"
  input: "conv1/act_quant/min"
  input: "save_1/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Identity"
  op: "Identity"
  input: "save_1/RestoreV2:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/AssignVariableOp"
  op: "AssignVariableOp"
  input: "conv1/bias"
  input: "save_1/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/Identity_1"
  op: "Identity"
  input: "save_1/RestoreV2:3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/AssignVariableOp_1"
  op: "AssignVariableOp"
  input: "conv1/kernel"
  input: "save_1/Identity_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/Assign_2"
  op: "Assign"
  input: "conv1/weights_quant/max"
  input: "save_1/RestoreV2:4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_3"
  op: "Assign"
  input: "conv1/weights_quant/min"
  input: "save_1/RestoreV2:5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_4"
  op: "Assign"
  input: "conv1_1/act_quant/max"
  input: "save_1/RestoreV2:6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_5"
  op: "Assign"
  input: "conv1_1/act_quant/min"
  input: "save_1/RestoreV2:7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Identity_2"
  op: "Identity"
  input: "save_1/RestoreV2:8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/AssignVariableOp_2"
  op: "AssignVariableOp"
  input: "conv1_1/bias"
  input: "save_1/Identity_2"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/Identity_3"
  op: "Identity"
  input: "save_1/RestoreV2:9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/AssignVariableOp_3"
  op: "AssignVariableOp"
  input: "conv1_1/kernel"
  input: "save_1/Identity_3"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/Assign_6"
  op: "Assign"
  input: "conv1_1/weights_quant/max"
  input: "save_1/RestoreV2:10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_7"
  op: "Assign"
  input: "conv1_1/weights_quant/min"
  input: "save_1/RestoreV2:11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_1/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_8"
  op: "Assign"
  input: "conv2/act_quant/max"
  input: "save_1/RestoreV2:12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_9"
  op: "Assign"
  input: "conv2/act_quant/min"
  input: "save_1/RestoreV2:13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Identity_4"
  op: "Identity"
  input: "save_1/RestoreV2:14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/AssignVariableOp_4"
  op: "AssignVariableOp"
  input: "conv2/bias"
  input: "save_1/Identity_4"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/Identity_5"
  op: "Identity"
  input: "save_1/RestoreV2:15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/AssignVariableOp_5"
  op: "AssignVariableOp"
  input: "conv2/kernel"
  input: "save_1/Identity_5"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/Assign_10"
  op: "Assign"
  input: "conv2/weights_quant/max"
  input: "save_1/RestoreV2:16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_11"
  op: "Assign"
  input: "conv2/weights_quant/min"
  input: "save_1/RestoreV2:17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_12"
  op: "Assign"
  input: "conv2_1/act_quant/max"
  input: "save_1/RestoreV2:18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_13"
  op: "Assign"
  input: "conv2_1/act_quant/min"
  input: "save_1/RestoreV2:19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Identity_6"
  op: "Identity"
  input: "save_1/RestoreV2:20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/AssignVariableOp_6"
  op: "AssignVariableOp"
  input: "conv2_1/bias"
  input: "save_1/Identity_6"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/Identity_7"
  op: "Identity"
  input: "save_1/RestoreV2:21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/AssignVariableOp_7"
  op: "AssignVariableOp"
  input: "conv2_1/kernel"
  input: "save_1/Identity_7"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/Assign_14"
  op: "Assign"
  input: "conv2_1/weights_quant/max"
  input: "save_1/RestoreV2:22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_15"
  op: "Assign"
  input: "conv2_1/weights_quant/min"
  input: "save_1/RestoreV2:23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_1/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_16"
  op: "Assign"
  input: "conv3/act_quant/max"
  input: "save_1/RestoreV2:24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_17"
  op: "Assign"
  input: "conv3/act_quant/min"
  input: "save_1/RestoreV2:25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Identity_8"
  op: "Identity"
  input: "save_1/RestoreV2:26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/AssignVariableOp_8"
  op: "AssignVariableOp"
  input: "conv3/bias"
  input: "save_1/Identity_8"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/Identity_9"
  op: "Identity"
  input: "save_1/RestoreV2:27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/AssignVariableOp_9"
  op: "AssignVariableOp"
  input: "conv3/kernel"
  input: "save_1/Identity_9"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/Assign_18"
  op: "Assign"
  input: "conv3/weights_quant/max"
  input: "save_1/RestoreV2:28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_19"
  op: "Assign"
  input: "conv3/weights_quant/min"
  input: "save_1/RestoreV2:29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_20"
  op: "Assign"
  input: "conv3_1/act_quant/max"
  input: "save_1/RestoreV2:30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_21"
  op: "Assign"
  input: "conv3_1/act_quant/min"
  input: "save_1/RestoreV2:31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Identity_10"
  op: "Identity"
  input: "save_1/RestoreV2:32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/AssignVariableOp_10"
  op: "AssignVariableOp"
  input: "conv3_1/bias"
  input: "save_1/Identity_10"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/Identity_11"
  op: "Identity"
  input: "save_1/RestoreV2:33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/AssignVariableOp_11"
  op: "AssignVariableOp"
  input: "conv3_1/kernel"
  input: "save_1/Identity_11"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save_1/Assign_22"
  op: "Assign"
  input: "conv3_1/weights_quant/max"
  input: "save_1/RestoreV2:34"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_23"
  op: "Assign"
  input: "conv3_1/weights_quant/min"
  input: "save_1/RestoreV2:35"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_1/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/restore_all"
  op: "NoOp"
  input: "^save_1/Assign"
  input: "^save_1/AssignVariableOp"
  input: "^save_1/AssignVariableOp_1"
  input: "^save_1/AssignVariableOp_10"
  input: "^save_1/AssignVariableOp_11"
  input: "^save_1/AssignVariableOp_2"
  input: "^save_1/AssignVariableOp_3"
  input: "^save_1/AssignVariableOp_4"
  input: "^save_1/AssignVariableOp_5"
  input: "^save_1/AssignVariableOp_6"
  input: "^save_1/AssignVariableOp_7"
  input: "^save_1/AssignVariableOp_8"
  input: "^save_1/AssignVariableOp_9"
  input: "^save_1/Assign_1"
  input: "^save_1/Assign_10"
  input: "^save_1/Assign_11"
  input: "^save_1/Assign_12"
  input: "^save_1/Assign_13"
  input: "^save_1/Assign_14"
  input: "^save_1/Assign_15"
  input: "^save_1/Assign_16"
  input: "^save_1/Assign_17"
  input: "^save_1/Assign_18"
  input: "^save_1/Assign_19"
  input: "^save_1/Assign_2"
  input: "^save_1/Assign_20"
  input: "^save_1/Assign_21"
  input: "^save_1/Assign_22"
  input: "^save_1/Assign_23"
  input: "^save_1/Assign_3"
  input: "^save_1/Assign_4"
  input: "^save_1/Assign_5"
  input: "^save_1/Assign_6"
  input: "^save_1/Assign_7"
  input: "^save_1/Assign_8"
  input: "^save_1/Assign_9"
}
node {
  name: "VarIsInitializedOp_14"
  op: "VarIsInitializedOp"
  input: "total_1"
}
node {
  name: "VarIsInitializedOp_15"
  op: "VarIsInitializedOp"
  input: "count_1"
}
node {
  name: "init_5"
  op: "NoOp"
  input: "^count_1/Assign"
  input: "^total_1/Assign"
}
node {
  name: "conv1_input_2"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 180
        }
        dim {
          size: 240
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv1_2/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "conv1_2/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.24618297815322876
      }
    }
  }
}
node {
  name: "conv1_2/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.24618297815322876
      }
    }
  }
}
node {
  name: "conv1_2/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv1_2/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv1_2/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv1_2/kernel/Initializer/random_uniform/max"
  input: "conv1_2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/kernel"
      }
    }
  }
}
node {
  name: "conv1_2/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv1_2/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv1_2/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/kernel"
      }
    }
  }
}
node {
  name: "conv1_2/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv1_2/kernel/Initializer/random_uniform/mul"
  input: "conv1_2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/kernel"
      }
    }
  }
}
node {
  name: "conv1_2/kernel"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv1_2/kernel"
    }
  }
}
node {
  name: "conv1_2/kernel/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv1_2/kernel"
}
node {
  name: "conv1_2/kernel/Assign"
  op: "AssignVariableOp"
  input: "conv1_2/kernel"
  input: "conv1_2/kernel/Initializer/random_uniform"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_2/kernel/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1_2/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_2/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1_2/bias"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv1_2/bias"
    }
  }
}
node {
  name: "conv1_2/bias/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv1_2/bias"
}
node {
  name: "conv1_2/bias/Assign"
  op: "AssignVariableOp"
  input: "conv1_2/bias"
  input: "conv1_2/bias/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_2/bias/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1_2/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_2/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv1_2/Conv2D/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1_2/kernel"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_2/Conv2D"
  op: "Conv2D"
  input: "conv1_input_2"
  input: "conv1_2/weights_quant/FakeQuantWithMinMaxVars"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_2/BiasAdd/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1_2/bias"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_2/BiasAdd"
  op: "BiasAdd"
  input: "conv1_2/Conv2D"
  input: "conv1_2/BiasAdd/ReadVariableOp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv1_2/Relu"
  op: "Relu"
  input: "conv1_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_2/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\n\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "conv2_2/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.18257418274879456
      }
    }
  }
}
node {
  name: "conv2_2/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.18257418274879456
      }
    }
  }
}
node {
  name: "conv2_2/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2_2/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv2_2/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv2_2/kernel/Initializer/random_uniform/max"
  input: "conv2_2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/kernel"
      }
    }
  }
}
node {
  name: "conv2_2/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv2_2/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv2_2/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/kernel"
      }
    }
  }
}
node {
  name: "conv2_2/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv2_2/kernel/Initializer/random_uniform/mul"
  input: "conv2_2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/kernel"
      }
    }
  }
}
node {
  name: "conv2_2/kernel"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv2_2/kernel"
    }
  }
}
node {
  name: "conv2_2/kernel/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv2_2/kernel"
}
node {
  name: "conv2_2/kernel/Assign"
  op: "AssignVariableOp"
  input: "conv2_2/kernel"
  input: "conv2_2/kernel/Initializer/random_uniform"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_2/kernel/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2_2/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_2/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2_2/bias"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv2_2/bias"
    }
  }
}
node {
  name: "conv2_2/bias/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv2_2/bias"
}
node {
  name: "conv2_2/bias/Assign"
  op: "AssignVariableOp"
  input: "conv2_2/bias"
  input: "conv2_2/bias/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_2/bias/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2_2/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_2/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2_2/Conv2D/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2_2/kernel"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_2/Conv2D"
  op: "Conv2D"
  input: "conv1_2/act_quant/FakeQuantWithMinMaxVars"
  input: "conv2_2/weights_quant/FakeQuantWithMinMaxVars"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_2/BiasAdd/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2_2/bias"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_2/BiasAdd"
  op: "BiasAdd"
  input: "conv2_2/Conv2D"
  input: "conv2_2/BiasAdd/ReadVariableOp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2_2/Relu"
  op: "Relu"
  input: "conv2_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_2/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\n\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv3_2/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.24618297815322876
      }
    }
  }
}
node {
  name: "conv3_2/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.24618297815322876
      }
    }
  }
}
node {
  name: "conv3_2/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv3_2/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv3_2/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv3_2/kernel/Initializer/random_uniform/max"
  input: "conv3_2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/kernel"
      }
    }
  }
}
node {
  name: "conv3_2/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv3_2/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv3_2/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/kernel"
      }
    }
  }
}
node {
  name: "conv3_2/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv3_2/kernel/Initializer/random_uniform/mul"
  input: "conv3_2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/kernel"
      }
    }
  }
}
node {
  name: "conv3_2/kernel"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv3_2/kernel"
    }
  }
}
node {
  name: "conv3_2/kernel/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv3_2/kernel"
}
node {
  name: "conv3_2/kernel/Assign"
  op: "AssignVariableOp"
  input: "conv3_2/kernel"
  input: "conv3_2/kernel/Initializer/random_uniform"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_2/kernel/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3_2/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_2/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3_2/bias"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv3_2/bias"
    }
  }
}
node {
  name: "conv3_2/bias/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv3_2/bias"
}
node {
  name: "conv3_2/bias/Assign"
  op: "AssignVariableOp"
  input: "conv3_2/bias"
  input: "conv3_2/bias/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_2/bias/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3_2/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_2/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv3_2/Conv2D/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3_2/kernel"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_2/Conv2D"
  op: "Conv2D"
  input: "conv2_2/act_quant/FakeQuantWithMinMaxVars"
  input: "conv3_2/weights_quant/FakeQuantWithMinMaxVars"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_2/BiasAdd/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3_2/bias"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_2/BiasAdd"
  op: "BiasAdd"
  input: "conv3_2/Conv2D"
  input: "conv3_2/BiasAdd/ReadVariableOp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv3_2/Relu"
  op: "Relu"
  input: "conv3_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "VarIsInitializedOp_16"
  op: "VarIsInitializedOp"
  input: "conv2_2/kernel"
}
node {
  name: "VarIsInitializedOp_17"
  op: "VarIsInitializedOp"
  input: "conv2_2/bias"
}
node {
  name: "VarIsInitializedOp_18"
  op: "VarIsInitializedOp"
  input: "conv3_2/kernel"
}
node {
  name: "VarIsInitializedOp_19"
  op: "VarIsInitializedOp"
  input: "conv1_2/kernel"
}
node {
  name: "VarIsInitializedOp_20"
  op: "VarIsInitializedOp"
  input: "conv3_2/bias"
}
node {
  name: "VarIsInitializedOp_21"
  op: "VarIsInitializedOp"
  input: "conv1_2/bias"
}
node {
  name: "init_6"
  op: "NoOp"
  input: "^conv1_2/bias/Assign"
  input: "^conv1_2/kernel/Assign"
  input: "^conv2_2/bias/Assign"
  input: "^conv2_2/kernel/Assign"
  input: "^conv3_2/bias/Assign"
  input: "^conv3_2/kernel/Assign"
}
node {
  name: "Const_2"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "RestoreV2_12/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_12/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_12"
  op: "RestoreV2"
  input: "Const_2"
  input: "RestoreV2_12/tensor_names"
  input: "RestoreV2_12/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_12"
  op: "Identity"
  input: "RestoreV2_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_12"
  op: "AssignVariableOp"
  input: "conv1_2/kernel"
  input: "Identity_12"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_13/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_13/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_13"
  op: "RestoreV2"
  input: "Const_2"
  input: "RestoreV2_13/tensor_names"
  input: "RestoreV2_13/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_13"
  op: "Identity"
  input: "RestoreV2_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_13"
  op: "AssignVariableOp"
  input: "conv1_2/bias"
  input: "Identity_13"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_14/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_14/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_14"
  op: "RestoreV2"
  input: "Const_2"
  input: "RestoreV2_14/tensor_names"
  input: "RestoreV2_14/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_14"
  op: "Identity"
  input: "RestoreV2_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_14"
  op: "AssignVariableOp"
  input: "conv2_2/kernel"
  input: "Identity_14"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_15/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_15/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_15"
  op: "RestoreV2"
  input: "Const_2"
  input: "RestoreV2_15/tensor_names"
  input: "RestoreV2_15/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_15"
  op: "Identity"
  input: "RestoreV2_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_15"
  op: "AssignVariableOp"
  input: "conv2_2/bias"
  input: "Identity_15"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_16/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_16/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_16"
  op: "RestoreV2"
  input: "Const_2"
  input: "RestoreV2_16/tensor_names"
  input: "RestoreV2_16/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_16"
  op: "Identity"
  input: "RestoreV2_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_16"
  op: "AssignVariableOp"
  input: "conv3_2/kernel"
  input: "Identity_16"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_17/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_17/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_17"
  op: "RestoreV2"
  input: "Const_2"
  input: "RestoreV2_17/tensor_names"
  input: "RestoreV2_17/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_17"
  op: "Identity"
  input: "RestoreV2_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_17"
  op: "AssignVariableOp"
  input: "conv3_2/bias"
  input: "Identity_17"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "inputs_1"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 180
        }
        dim {
          size: 240
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv1_input_3"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 180
        }
        dim {
          size: 240
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv1_3/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "conv1_3/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.24618297815322876
      }
    }
  }
}
node {
  name: "conv1_3/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.24618297815322876
      }
    }
  }
}
node {
  name: "conv1_3/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv1_3/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv1_3/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv1_3/kernel/Initializer/random_uniform/max"
  input: "conv1_3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/kernel"
      }
    }
  }
}
node {
  name: "conv1_3/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv1_3/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv1_3/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/kernel"
      }
    }
  }
}
node {
  name: "conv1_3/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv1_3/kernel/Initializer/random_uniform/mul"
  input: "conv1_3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/kernel"
      }
    }
  }
}
node {
  name: "conv1_3/kernel"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv1_3/kernel"
    }
  }
}
node {
  name: "conv1_3/kernel/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv1_3/kernel"
}
node {
  name: "conv1_3/kernel/Assign"
  op: "AssignVariableOp"
  input: "conv1_3/kernel"
  input: "conv1_3/kernel/Initializer/random_uniform"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_3/kernel/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1_3/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_3/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1_3/bias"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv1_3/bias"
    }
  }
}
node {
  name: "conv1_3/bias/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv1_3/bias"
}
node {
  name: "conv1_3/bias/Assign"
  op: "AssignVariableOp"
  input: "conv1_3/bias"
  input: "conv1_3/bias/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_3/bias/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1_3/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_3/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv1_3/Conv2D/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1_3/kernel"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_3/Conv2D"
  op: "Conv2D"
  input: "conv1_input_3"
  input: "conv1_3/weights_quant/FakeQuantWithMinMaxVars"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_3/BiasAdd/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv1_3/bias"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_3/BiasAdd"
  op: "BiasAdd"
  input: "conv1_3/Conv2D"
  input: "conv1_3/BiasAdd/ReadVariableOp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv1_3/Relu"
  op: "Relu"
  input: "conv1_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_3/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\n\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "conv2_3/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.18257418274879456
      }
    }
  }
}
node {
  name: "conv2_3/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.18257418274879456
      }
    }
  }
}
node {
  name: "conv2_3/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2_3/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv2_3/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv2_3/kernel/Initializer/random_uniform/max"
  input: "conv2_3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/kernel"
      }
    }
  }
}
node {
  name: "conv2_3/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv2_3/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv2_3/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/kernel"
      }
    }
  }
}
node {
  name: "conv2_3/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv2_3/kernel/Initializer/random_uniform/mul"
  input: "conv2_3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/kernel"
      }
    }
  }
}
node {
  name: "conv2_3/kernel"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv2_3/kernel"
    }
  }
}
node {
  name: "conv2_3/kernel/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv2_3/kernel"
}
node {
  name: "conv2_3/kernel/Assign"
  op: "AssignVariableOp"
  input: "conv2_3/kernel"
  input: "conv2_3/kernel/Initializer/random_uniform"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_3/kernel/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2_3/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_3/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2_3/bias"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv2_3/bias"
    }
  }
}
node {
  name: "conv2_3/bias/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv2_3/bias"
}
node {
  name: "conv2_3/bias/Assign"
  op: "AssignVariableOp"
  input: "conv2_3/bias"
  input: "conv2_3/bias/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_3/bias/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2_3/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_3/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2_3/Conv2D/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2_3/kernel"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_3/Conv2D"
  op: "Conv2D"
  input: "conv1_3/act_quant/FakeQuantWithMinMaxVars"
  input: "conv2_3/weights_quant/FakeQuantWithMinMaxVars"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_3/BiasAdd/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv2_3/bias"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2_3/BiasAdd"
  op: "BiasAdd"
  input: "conv2_3/Conv2D"
  input: "conv2_3/BiasAdd/ReadVariableOp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2_3/Relu"
  op: "Relu"
  input: "conv2_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_3/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\n\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv3_3/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.24618297815322876
      }
    }
  }
}
node {
  name: "conv3_3/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.24618297815322876
      }
    }
  }
}
node {
  name: "conv3_3/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv3_3/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "conv3_3/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "conv3_3/kernel/Initializer/random_uniform/max"
  input: "conv3_3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/kernel"
      }
    }
  }
}
node {
  name: "conv3_3/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "conv3_3/kernel/Initializer/random_uniform/RandomUniform"
  input: "conv3_3/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/kernel"
      }
    }
  }
}
node {
  name: "conv3_3/kernel/Initializer/random_uniform"
  op: "Add"
  input: "conv3_3/kernel/Initializer/random_uniform/mul"
  input: "conv3_3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/kernel"
      }
    }
  }
}
node {
  name: "conv3_3/kernel"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 10
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv3_3/kernel"
    }
  }
}
node {
  name: "conv3_3/kernel/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv3_3/kernel"
}
node {
  name: "conv3_3/kernel/Assign"
  op: "AssignVariableOp"
  input: "conv3_3/kernel"
  input: "conv3_3/kernel/Initializer/random_uniform"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_3/kernel/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3_3/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_3/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3_3/bias"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "conv3_3/bias"
    }
  }
}
node {
  name: "conv3_3/bias/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "conv3_3/bias"
}
node {
  name: "conv3_3/bias/Assign"
  op: "AssignVariableOp"
  input: "conv3_3/bias"
  input: "conv3_3/bias/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_3/bias/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3_3/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_3/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv3_3/Conv2D/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3_3/kernel"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_3/Conv2D"
  op: "Conv2D"
  input: "conv2_3/act_quant/FakeQuantWithMinMaxVars"
  input: "conv3_3/weights_quant/FakeQuantWithMinMaxVars"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_3/BiasAdd/ReadVariableOp"
  op: "ReadVariableOp"
  input: "conv3_3/bias"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv3_3/BiasAdd"
  op: "BiasAdd"
  input: "conv3_3/Conv2D"
  input: "conv3_3/BiasAdd/ReadVariableOp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv3_3/Relu"
  op: "Relu"
  input: "conv3_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "VarIsInitializedOp_22"
  op: "VarIsInitializedOp"
  input: "conv1_3/kernel"
}
node {
  name: "VarIsInitializedOp_23"
  op: "VarIsInitializedOp"
  input: "conv3_3/kernel"
}
node {
  name: "VarIsInitializedOp_24"
  op: "VarIsInitializedOp"
  input: "conv1_3/bias"
}
node {
  name: "VarIsInitializedOp_25"
  op: "VarIsInitializedOp"
  input: "conv3_3/bias"
}
node {
  name: "VarIsInitializedOp_26"
  op: "VarIsInitializedOp"
  input: "conv2_3/kernel"
}
node {
  name: "VarIsInitializedOp_27"
  op: "VarIsInitializedOp"
  input: "conv2_3/bias"
}
node {
  name: "init_7"
  op: "NoOp"
  input: "^conv1_3/bias/Assign"
  input: "^conv1_3/kernel/Assign"
  input: "^conv2_3/bias/Assign"
  input: "^conv2_3/kernel/Assign"
  input: "^conv3_3/bias/Assign"
  input: "^conv3_3/kernel/Assign"
}
node {
  name: "Const_3"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "RestoreV2_18/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_18/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_18"
  op: "RestoreV2"
  input: "Const_3"
  input: "RestoreV2_18/tensor_names"
  input: "RestoreV2_18/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_18"
  op: "Identity"
  input: "RestoreV2_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_18"
  op: "AssignVariableOp"
  input: "conv1_3/kernel"
  input: "Identity_18"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_19/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_19/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_19"
  op: "RestoreV2"
  input: "Const_3"
  input: "RestoreV2_19/tensor_names"
  input: "RestoreV2_19/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_19"
  op: "Identity"
  input: "RestoreV2_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_19"
  op: "AssignVariableOp"
  input: "conv1_3/bias"
  input: "Identity_19"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_20/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_20/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_20"
  op: "RestoreV2"
  input: "Const_3"
  input: "RestoreV2_20/tensor_names"
  input: "RestoreV2_20/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_20"
  op: "Identity"
  input: "RestoreV2_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_20"
  op: "AssignVariableOp"
  input: "conv2_3/kernel"
  input: "Identity_20"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_21/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_21/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_21"
  op: "RestoreV2"
  input: "Const_3"
  input: "RestoreV2_21/tensor_names"
  input: "RestoreV2_21/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_21"
  op: "Identity"
  input: "RestoreV2_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_21"
  op: "AssignVariableOp"
  input: "conv2_3/bias"
  input: "Identity_21"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_22/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_22/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_22"
  op: "RestoreV2"
  input: "Const_3"
  input: "RestoreV2_22/tensor_names"
  input: "RestoreV2_22/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_22"
  op: "Identity"
  input: "RestoreV2_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_22"
  op: "AssignVariableOp"
  input: "conv3_3/kernel"
  input: "Identity_22"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "RestoreV2_23/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE"
      }
    }
  }
}
node {
  name: "RestoreV2_23/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "RestoreV2_23"
  op: "RestoreV2"
  input: "Const_3"
  input: "RestoreV2_23/tensor_names"
  input: "RestoreV2_23/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "Identity_23"
  op: "Identity"
  input: "RestoreV2_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AssignVariableOp_23"
  op: "AssignVariableOp"
  input: "conv3_3/bias"
  input: "Identity_23"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "inputs_2"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 180
        }
        dim {
          size: 240
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv3_target_2"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: -1
        }
        dim {
          size: -1
        }
        dim {
          size: -1
        }
      }
    }
  }
}
node {
  name: "total_2/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@total_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "total_2"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@total_2"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "total_2"
    }
  }
}
node {
  name: "total_2/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "total_2"
}
node {
  name: "total_2/Assign"
  op: "AssignVariableOp"
  input: "total_2"
  input: "total_2/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@total_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "total_2/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "total_2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@total_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "count_2/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@count_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "count_2"
  op: "VarHandleOp"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@count_2"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: "count_2"
    }
  }
}
node {
  name: "count_2/IsInitialized/VarIsInitializedOp"
  op: "VarIsInitializedOp"
  input: "count_2"
}
node {
  name: "count_2/Assign"
  op: "AssignVariableOp"
  input: "count_2"
  input: "count_2/Initializer/zeros"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@count_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "count_2/Read/ReadVariableOp"
  op: "ReadVariableOp"
  input: "count_2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@count_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/SquaredDifference"
  op: "SquaredDifference"
  input: "conv3_3/act_quant/FakeQuantWithMinMaxVars"
  input: "conv3_target_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/Mean"
  op: "Mean"
  input: "metrics_4/mean_squared_error/SquaredDifference"
  input: "metrics_4/mean_squared_error/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/Sum"
  op: "Sum"
  input: "metrics_4/mean_squared_error/Mean"
  input: "metrics_4/mean_squared_error/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/AssignAddVariableOp"
  op: "AssignAddVariableOp"
  input: "total_2"
  input: "metrics_4/mean_squared_error/Sum"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/ReadVariableOp"
  op: "ReadVariableOp"
  input: "total_2"
  input: "^metrics_4/mean_squared_error/AssignAddVariableOp"
  input: "^metrics_4/mean_squared_error/Sum"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/Size"
  op: "Size"
  input: "metrics_4/mean_squared_error/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/Cast"
  op: "Cast"
  input: "metrics_4/mean_squared_error/Size"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/AssignAddVariableOp_1"
  op: "AssignAddVariableOp"
  input: "count_2"
  input: "metrics_4/mean_squared_error/Cast"
  input: "^metrics_4/mean_squared_error/AssignAddVariableOp"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/ReadVariableOp_1"
  op: "ReadVariableOp"
  input: "count_2"
  input: "^metrics_4/mean_squared_error/AssignAddVariableOp"
  input: "^metrics_4/mean_squared_error/AssignAddVariableOp_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/div_no_nan/ReadVariableOp"
  op: "ReadVariableOp"
  input: "total_2"
  input: "^metrics_4/mean_squared_error/AssignAddVariableOp_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/div_no_nan/ReadVariableOp_1"
  op: "ReadVariableOp"
  input: "count_2"
  input: "^metrics_4/mean_squared_error/AssignAddVariableOp_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/div_no_nan"
  op: "DivNoNan"
  input: "metrics_4/mean_squared_error/div_no_nan/ReadVariableOp"
  input: "metrics_4/mean_squared_error/div_no_nan/ReadVariableOp_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics_4/mean_squared_error/Identity"
  op: "Identity"
  input: "metrics_4/mean_squared_error/div_no_nan"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_2/conv3_loss/SquaredDifference"
  op: "SquaredDifference"
  input: "conv3_3/act_quant/FakeQuantWithMinMaxVars"
  input: "conv3_target_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_2/conv3_loss/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "loss_2/conv3_loss/Mean"
  op: "Mean"
  input: "loss_2/conv3_loss/SquaredDifference"
  input: "loss_2/conv3_loss/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss_2/conv3_loss/weighted_loss/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss_2/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss_2/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/weights/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss_2/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/shape"
  op: "Shape"
  input: "loss_2/conv3_loss/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss_2/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/values/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "loss_2/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  op: "NoOp"
}
node {
  name: "loss_2/conv3_loss/weighted_loss/broadcast_weights/ones_like/Shape"
  op: "Shape"
  input: "loss_2/conv3_loss/Mean"
  input: "^loss_2/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss_2/conv3_loss/weighted_loss/broadcast_weights/ones_like/Const"
  op: "Const"
  input: "^loss_2/conv3_loss/weighted_loss/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss_2/conv3_loss/weighted_loss/broadcast_weights/ones_like"
  op: "Fill"
  input: "loss_2/conv3_loss/weighted_loss/broadcast_weights/ones_like/Shape"
  input: "loss_2/conv3_loss/weighted_loss/broadcast_weights/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss_2/conv3_loss/weighted_loss/broadcast_weights"
  op: "Mul"
  input: "loss_2/conv3_loss/weighted_loss/Const"
  input: "loss_2/conv3_loss/weighted_loss/broadcast_weights/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_2/conv3_loss/weighted_loss/Mul"
  op: "Mul"
  input: "loss_2/conv3_loss/Mean"
  input: "loss_2/conv3_loss/weighted_loss/broadcast_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_2/conv3_loss/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "loss_2/conv3_loss/Sum"
  op: "Sum"
  input: "loss_2/conv3_loss/weighted_loss/Mul"
  input: "loss_2/conv3_loss/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss_2/conv3_loss/num_elements"
  op: "Size"
  input: "loss_2/conv3_loss/weighted_loss/Mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "loss_2/conv3_loss/num_elements/Cast"
  op: "Cast"
  input: "loss_2/conv3_loss/num_elements"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "loss_2/conv3_loss/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss_2/conv3_loss/Sum_1"
  op: "Sum"
  input: "loss_2/conv3_loss/Sum"
  input: "loss_2/conv3_loss/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss_2/conv3_loss/value"
  op: "DivNoNan"
  input: "loss_2/conv3_loss/Sum_1"
  input: "loss_2/conv3_loss/num_elements/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss_2/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss_2/mul"
  op: "Mul"
  input: "loss_2/mul/x"
  input: "loss_2/conv3_loss/value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv1_2/weights_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/weights_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -6.0
      }
    }
  }
}
node {
  name: "conv1_2/weights_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/weights_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1_2/weights_quant/min/Assign"
  op: "Assign"
  input: "conv1_2/weights_quant/min"
  input: "conv1_2/weights_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_2/weights_quant/min/read"
  op: "Identity"
  input: "conv1_2/weights_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/weights_quant/min"
      }
    }
  }
}
node {
  name: "conv1_2/weights_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/weights_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv1_2/weights_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/weights_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1_2/weights_quant/max/Assign"
  op: "Assign"
  input: "conv1_2/weights_quant/max"
  input: "conv1_2/weights_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_2/weights_quant/max/read"
  op: "Identity"
  input: "conv1_2/weights_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/weights_quant/max"
      }
    }
  }
}
node {
  name: "conv1_2/weights_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv1_2/Conv2D/ReadVariableOp"
  input: "conv1_2/weights_quant/min/read"
  input: "conv1_2/weights_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: true
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv1_2/act_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/act_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1_2/act_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/act_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1_2/act_quant/min/Assign"
  op: "Assign"
  input: "conv1_2/act_quant/min"
  input: "conv1_2/act_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_2/act_quant/min/read"
  op: "Identity"
  input: "conv1_2/act_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/act_quant/min"
      }
    }
  }
}
node {
  name: "conv1_2/act_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/act_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv1_2/act_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/act_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1_2/act_quant/max/Assign"
  op: "Assign"
  input: "conv1_2/act_quant/max"
  input: "conv1_2/act_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_2/act_quant/max/read"
  op: "Identity"
  input: "conv1_2/act_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_2/act_quant/max"
      }
    }
  }
}
node {
  name: "conv1_2/act_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv1_2/Relu"
  input: "conv1_2/act_quant/min/read"
  input: "conv1_2/act_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: false
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv2_2/weights_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/weights_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -6.0
      }
    }
  }
}
node {
  name: "conv2_2/weights_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/weights_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2_2/weights_quant/min/Assign"
  op: "Assign"
  input: "conv2_2/weights_quant/min"
  input: "conv2_2/weights_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_2/weights_quant/min/read"
  op: "Identity"
  input: "conv2_2/weights_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/weights_quant/min"
      }
    }
  }
}
node {
  name: "conv2_2/weights_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/weights_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv2_2/weights_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/weights_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2_2/weights_quant/max/Assign"
  op: "Assign"
  input: "conv2_2/weights_quant/max"
  input: "conv2_2/weights_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_2/weights_quant/max/read"
  op: "Identity"
  input: "conv2_2/weights_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/weights_quant/max"
      }
    }
  }
}
node {
  name: "conv2_2/weights_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv2_2/Conv2D/ReadVariableOp"
  input: "conv2_2/weights_quant/min/read"
  input: "conv2_2/weights_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: true
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv2_2/act_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/act_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2_2/act_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/act_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2_2/act_quant/min/Assign"
  op: "Assign"
  input: "conv2_2/act_quant/min"
  input: "conv2_2/act_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_2/act_quant/min/read"
  op: "Identity"
  input: "conv2_2/act_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/act_quant/min"
      }
    }
  }
}
node {
  name: "conv2_2/act_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/act_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv2_2/act_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/act_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2_2/act_quant/max/Assign"
  op: "Assign"
  input: "conv2_2/act_quant/max"
  input: "conv2_2/act_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_2/act_quant/max/read"
  op: "Identity"
  input: "conv2_2/act_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_2/act_quant/max"
      }
    }
  }
}
node {
  name: "conv2_2/act_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv2_2/Relu"
  input: "conv2_2/act_quant/min/read"
  input: "conv2_2/act_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: false
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv3_2/weights_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/weights_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -6.0
      }
    }
  }
}
node {
  name: "conv3_2/weights_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/weights_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3_2/weights_quant/min/Assign"
  op: "Assign"
  input: "conv3_2/weights_quant/min"
  input: "conv3_2/weights_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_2/weights_quant/min/read"
  op: "Identity"
  input: "conv3_2/weights_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/weights_quant/min"
      }
    }
  }
}
node {
  name: "conv3_2/weights_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/weights_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv3_2/weights_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/weights_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3_2/weights_quant/max/Assign"
  op: "Assign"
  input: "conv3_2/weights_quant/max"
  input: "conv3_2/weights_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_2/weights_quant/max/read"
  op: "Identity"
  input: "conv3_2/weights_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/weights_quant/max"
      }
    }
  }
}
node {
  name: "conv3_2/weights_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv3_2/Conv2D/ReadVariableOp"
  input: "conv3_2/weights_quant/min/read"
  input: "conv3_2/weights_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: true
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv3_2/act_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/act_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3_2/act_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/act_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3_2/act_quant/min/Assign"
  op: "Assign"
  input: "conv3_2/act_quant/min"
  input: "conv3_2/act_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_2/act_quant/min/read"
  op: "Identity"
  input: "conv3_2/act_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/act_quant/min"
      }
    }
  }
}
node {
  name: "conv3_2/act_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/act_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv3_2/act_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/act_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3_2/act_quant/max/Assign"
  op: "Assign"
  input: "conv3_2/act_quant/max"
  input: "conv3_2/act_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_2/act_quant/max/read"
  op: "Identity"
  input: "conv3_2/act_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_2/act_quant/max"
      }
    }
  }
}
node {
  name: "conv3_2/act_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv3_2/Relu"
  input: "conv3_2/act_quant/min/read"
  input: "conv3_2/act_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: false
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv1_3/weights_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/weights_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -6.0
      }
    }
  }
}
node {
  name: "conv1_3/weights_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/weights_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1_3/weights_quant/min/Assign"
  op: "Assign"
  input: "conv1_3/weights_quant/min"
  input: "conv1_3/weights_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_3/weights_quant/min/read"
  op: "Identity"
  input: "conv1_3/weights_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/weights_quant/min"
      }
    }
  }
}
node {
  name: "conv1_3/weights_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/weights_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv1_3/weights_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/weights_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1_3/weights_quant/max/Assign"
  op: "Assign"
  input: "conv1_3/weights_quant/max"
  input: "conv1_3/weights_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_3/weights_quant/max/read"
  op: "Identity"
  input: "conv1_3/weights_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/weights_quant/max"
      }
    }
  }
}
node {
  name: "conv1_3/weights_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv1_3/Conv2D/ReadVariableOp"
  input: "conv1_3/weights_quant/min/read"
  input: "conv1_3/weights_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: true
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv1_3/act_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/act_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv1_3/act_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/act_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1_3/act_quant/min/Assign"
  op: "Assign"
  input: "conv1_3/act_quant/min"
  input: "conv1_3/act_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_3/act_quant/min/read"
  op: "Identity"
  input: "conv1_3/act_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/act_quant/min"
      }
    }
  }
}
node {
  name: "conv1_3/act_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/act_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv1_3/act_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/act_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv1_3/act_quant/max/Assign"
  op: "Assign"
  input: "conv1_3/act_quant/max"
  input: "conv1_3/act_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv1_3/act_quant/max/read"
  op: "Identity"
  input: "conv1_3/act_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv1_3/act_quant/max"
      }
    }
  }
}
node {
  name: "conv1_3/act_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv1_3/Relu"
  input: "conv1_3/act_quant/min/read"
  input: "conv1_3/act_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: false
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv2_3/weights_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/weights_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -6.0
      }
    }
  }
}
node {
  name: "conv2_3/weights_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/weights_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2_3/weights_quant/min/Assign"
  op: "Assign"
  input: "conv2_3/weights_quant/min"
  input: "conv2_3/weights_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_3/weights_quant/min/read"
  op: "Identity"
  input: "conv2_3/weights_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/weights_quant/min"
      }
    }
  }
}
node {
  name: "conv2_3/weights_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/weights_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv2_3/weights_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/weights_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2_3/weights_quant/max/Assign"
  op: "Assign"
  input: "conv2_3/weights_quant/max"
  input: "conv2_3/weights_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_3/weights_quant/max/read"
  op: "Identity"
  input: "conv2_3/weights_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/weights_quant/max"
      }
    }
  }
}
node {
  name: "conv2_3/weights_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv2_3/Conv2D/ReadVariableOp"
  input: "conv2_3/weights_quant/min/read"
  input: "conv2_3/weights_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: true
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv2_3/act_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/act_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2_3/act_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/act_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2_3/act_quant/min/Assign"
  op: "Assign"
  input: "conv2_3/act_quant/min"
  input: "conv2_3/act_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_3/act_quant/min/read"
  op: "Identity"
  input: "conv2_3/act_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/act_quant/min"
      }
    }
  }
}
node {
  name: "conv2_3/act_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/act_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv2_3/act_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/act_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2_3/act_quant/max/Assign"
  op: "Assign"
  input: "conv2_3/act_quant/max"
  input: "conv2_3/act_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2_3/act_quant/max/read"
  op: "Identity"
  input: "conv2_3/act_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2_3/act_quant/max"
      }
    }
  }
}
node {
  name: "conv2_3/act_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv2_3/Relu"
  input: "conv2_3/act_quant/min/read"
  input: "conv2_3/act_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: false
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv3_3/weights_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/weights_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -6.0
      }
    }
  }
}
node {
  name: "conv3_3/weights_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/weights_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3_3/weights_quant/min/Assign"
  op: "Assign"
  input: "conv3_3/weights_quant/min"
  input: "conv3_3/weights_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/weights_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_3/weights_quant/min/read"
  op: "Identity"
  input: "conv3_3/weights_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/weights_quant/min"
      }
    }
  }
}
node {
  name: "conv3_3/weights_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/weights_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv3_3/weights_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/weights_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3_3/weights_quant/max/Assign"
  op: "Assign"
  input: "conv3_3/weights_quant/max"
  input: "conv3_3/weights_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/weights_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_3/weights_quant/max/read"
  op: "Identity"
  input: "conv3_3/weights_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/weights_quant/max"
      }
    }
  }
}
node {
  name: "conv3_3/weights_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv3_3/Conv2D/ReadVariableOp"
  input: "conv3_3/weights_quant/min/read"
  input: "conv3_3/weights_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: true
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "conv3_3/act_quant/min/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/act_quant/min"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv3_3/act_quant/min"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/act_quant/min"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3_3/act_quant/min/Assign"
  op: "Assign"
  input: "conv3_3/act_quant/min"
  input: "conv3_3/act_quant/min/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/act_quant/min"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_3/act_quant/min/read"
  op: "Identity"
  input: "conv3_3/act_quant/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/act_quant/min"
      }
    }
  }
}
node {
  name: "conv3_3/act_quant/max/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/act_quant/max"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 6.0
      }
    }
  }
}
node {
  name: "conv3_3/act_quant/max"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/act_quant/max"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv3_3/act_quant/max/Assign"
  op: "Assign"
  input: "conv3_3/act_quant/max"
  input: "conv3_3/act_quant/max/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/act_quant/max"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv3_3/act_quant/max/read"
  op: "Identity"
  input: "conv3_3/act_quant/max"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv3_3/act_quant/max"
      }
    }
  }
}
node {
  name: "conv3_3/act_quant/FakeQuantWithMinMaxVars"
  op: "FakeQuantWithMinMaxVars"
  input: "conv3_3/Relu"
  input: "conv3_3/act_quant/min/read"
  input: "conv3_3/act_quant/max/read"
  attr {
    key: "narrow_range"
    value {
      b: false
    }
  }
  attr {
    key: "num_bits"
    value {
      i: 8
    }
  }
}
node {
  name: "init_8"
  op: "NoOp"
  input: "^conv1/act_quant/max/Assign"
  input: "^conv1/act_quant/min/Assign"
  input: "^conv1/bias/Assign"
  input: "^conv1/kernel/Assign"
  input: "^conv1/weights_quant/max/Assign"
  input: "^conv1/weights_quant/min/Assign"
  input: "^conv1_1/act_quant/max/Assign"
  input: "^conv1_1/act_quant/min/Assign"
  input: "^conv1_1/bias/Assign"
  input: "^conv1_1/kernel/Assign"
  input: "^conv1_1/weights_quant/max/Assign"
  input: "^conv1_1/weights_quant/min/Assign"
  input: "^conv1_2/act_quant/max/Assign"
  input: "^conv1_2/act_quant/min/Assign"
  input: "^conv1_2/bias/Assign"
  input: "^conv1_2/kernel/Assign"
  input: "^conv1_2/weights_quant/max/Assign"
  input: "^conv1_2/weights_quant/min/Assign"
  input: "^conv1_3/act_quant/max/Assign"
  input: "^conv1_3/act_quant/min/Assign"
  input: "^conv1_3/bias/Assign"
  input: "^conv1_3/kernel/Assign"
  input: "^conv1_3/weights_quant/max/Assign"
  input: "^conv1_3/weights_quant/min/Assign"
  input: "^conv2/act_quant/max/Assign"
  input: "^conv2/act_quant/min/Assign"
  input: "^conv2/bias/Assign"
  input: "^conv2/kernel/Assign"
  input: "^conv2/weights_quant/max/Assign"
  input: "^conv2/weights_quant/min/Assign"
  input: "^conv2_1/act_quant/max/Assign"
  input: "^conv2_1/act_quant/min/Assign"
  input: "^conv2_1/bias/Assign"
  input: "^conv2_1/kernel/Assign"
  input: "^conv2_1/weights_quant/max/Assign"
  input: "^conv2_1/weights_quant/min/Assign"
  input: "^conv2_2/act_quant/max/Assign"
  input: "^conv2_2/act_quant/min/Assign"
  input: "^conv2_2/bias/Assign"
  input: "^conv2_2/kernel/Assign"
  input: "^conv2_2/weights_quant/max/Assign"
  input: "^conv2_2/weights_quant/min/Assign"
  input: "^conv2_3/act_quant/max/Assign"
  input: "^conv2_3/act_quant/min/Assign"
  input: "^conv2_3/bias/Assign"
  input: "^conv2_3/kernel/Assign"
  input: "^conv2_3/weights_quant/max/Assign"
  input: "^conv2_3/weights_quant/min/Assign"
  input: "^conv3/act_quant/max/Assign"
  input: "^conv3/act_quant/min/Assign"
  input: "^conv3/bias/Assign"
  input: "^conv3/kernel/Assign"
  input: "^conv3/weights_quant/max/Assign"
  input: "^conv3/weights_quant/min/Assign"
  input: "^conv3_1/act_quant/max/Assign"
  input: "^conv3_1/act_quant/min/Assign"
  input: "^conv3_1/bias/Assign"
  input: "^conv3_1/kernel/Assign"
  input: "^conv3_1/weights_quant/max/Assign"
  input: "^conv3_1/weights_quant/min/Assign"
  input: "^conv3_2/act_quant/max/Assign"
  input: "^conv3_2/act_quant/min/Assign"
  input: "^conv3_2/bias/Assign"
  input: "^conv3_2/kernel/Assign"
  input: "^conv3_2/weights_quant/max/Assign"
  input: "^conv3_2/weights_quant/min/Assign"
  input: "^conv3_3/act_quant/max/Assign"
  input: "^conv3_3/act_quant/min/Assign"
  input: "^conv3_3/bias/Assign"
  input: "^conv3_3/kernel/Assign"
  input: "^conv3_3/weights_quant/max/Assign"
  input: "^conv3_3/weights_quant/min/Assign"
}
versions {
  producer: 38
}
