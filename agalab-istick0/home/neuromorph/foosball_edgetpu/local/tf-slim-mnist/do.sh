cd /home/neuromorph/foosball_edgetpu/local/tf-slim-mnist
python convert_to_records.py
rm -rf logs
python mnist_train.py
python export.py  --quantize
tflite_convert \
  --output_file="output_tflite_graph.tflite" \
  --graph_def_file="frozen_mnist.pb" \
  --inference_type=QUANTIZED_UINT8 \
  --input_arrays="images" \
  --output_arrays="fully_connected5/BiasAdd" \
  --mean_values=0 \
  --std_dev_values=128 \
  --input_shapes="1,28,28,1"\
  --default_ranges_min=-60 \
  --default_ranges_max=60 
edgetpu_compiler output_tflite_graph.tflite
