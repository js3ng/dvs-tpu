docker run --name edgetpu-classify --rm -it --privileged -p 6006:6006 --mount type=bind,src=/home/eneftci/Projects/opt/tflite,dst=/home/neuromorph/foosball_edgetpu edgetpu-classify

