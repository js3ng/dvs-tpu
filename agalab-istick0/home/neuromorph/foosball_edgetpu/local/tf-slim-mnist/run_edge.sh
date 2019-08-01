
wget http://neuralnetworksanddeeplearning.com/images/mnist_complete_zero.png -O ~/zero.jpg

cd /usr/lib/python3/dist-packages/edgetpu/demo/

python3 classify_image.py \
--model ~/output_tflite_graph_edgetpu.tflite \
--label ~/labels.txt \
--input ~/flower.jpg
