##EDGE TPU Ball Tracking 

1. Load the dtaset, this will take a while and write two files, f1.npy and f2.npy:
python3 balls_dataset_loader

The scripts assume that the ABR ball tracking dataset is in 
directory = '/home/eneftci/Projects/share/data/ABR DAVIS Trajectory Dataset/'

change that accordingly in balls_dataset.py

2. Convert them into tf records. You may have to create a directory /tmp/data
python3 balls_convert_dataset_to_records.py

3. Run the training. Be sure to delete the logs/ directory if training a new model
python3 balls_train.py

4. Freeze the graph
python3 export,py

5. Convert to tflite:
tflite_convert \
  --output_file="output_tflite_graph.tflite" \
  --graph_def_file="frozen_mnist.pb" \
  --inference_type=QUANTIZED_UINT8 \
  --input_arrays="images" \
  --output_arrays="LeNet/fc4/BiasAdd" \
  --mean_values=0 \
  --std_dev_values=1 \
  --input_shapes="1,240,180,2"\
  --default_ranges_min=00\
  --default_ranges_max=250

6. On a computer with edgetpu_compiler installed, run
edgetpu_compiler output_tflite_graph.tflite 

(you may have to change the output file name accordingly

7. copy over the result to the edgetpu
scp output_tflite_graph_edgetpu.tflite mendel@ipaddr:

8. copy over the client script
scp edgetpu/detect_ball.py mendel@ipaddr:

9. On the tpu:
cd /home/mendel
python3 detect_ball.py --model output_tflite_graph_edgetpu.tflite
