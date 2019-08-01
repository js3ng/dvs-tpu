tflite_convert --output_file "test.tflite" --graph_def_file "frozen_model.pb" --inference_type QUANTIZED_UINT8 --input_arrays "inputs" --input_shapes "1,180,240,1" --output_arrays "conv3/Relu" --std_dev_values 128 --mean_values 0 --default_ranges_min -60 --default_ranges_max 60
        
tflite_convert --output_file "test.tflite" --keras_model_file "model_quant_eval.h5" --inference_type QUANTIZED_UINT8 --input_arrays "images" --input_shapes "1,180,240,1" --output_arrays "conv3/Relu" --std_dev_values 128 --mean_values 0 --default_ranges_min -60 --default_ranges_max 60

tflite_convert --output_file "kerasIN_cnn_test.tflite" --keras_model_file "model_quant_eval.h5" --inference_type QUANTIZED_UINT8 --std_dev_values 128 --mean_values 0 --default_ranges_min -60 --default_ranges_max 60

tflite_convert --output_file "pbIN_cnn_test.tflite" --graph_def_file "frozen_model.pb" --inference_type QUANTIZED_UINT8 --std_dev_values 128 --mean_values 0 --default_ranges_min -60 --default_ranges_max 60 --output_arrays "conv3/Relu"

tflite_convert --output_file "kerasIN_cnn_test.tflite" --keras_model_file "model_quant_eval.h5" --inference_type QUANTIZED_UINT8 --std_dev_values 128 --mean_values 0 --default_ranges_min -60 --default_ranges_max 60

tflite_convert --output_file "cnn_keras_point_eval.tflite" --keras_model_file "cnn_keras_point_eval.h5" --inference_type QUANTIZED_UINT8 --std_dev_values 128 --mean_values 0 --default_ranges_min -60 --default_ranges_max 60
