source ~/anaconda3/etc/profile.d/conda.sh
##
## download tests

# tensorflow1

# tensorflow2

# pytorch
#wget https://raw.githubusercontent.com/pytorch/examples/master/mnist/main.py -O pytorch.py
# adopt the data folder
#sed -i 's#../data#./data#g' pytorch.py

# tensorflow1
#wget https://raw.githubusercontent.com/aymericdamien/TensorFlow-Examples/master/tensorflow_v1/examples/3_NeuralNetworks/neural_network.py -O tensorflow1.py
#sed -i 's#/tmp/data#./data#g' tensorflow1.py
#sed -i 's#num_epochs=None#num_epochs=3#g' tensorflow1.py



#conda activate CPU__tensorflow1
#echo "tensorflow1 CPU start" `date`  > tests_time.txt
#python tensorflow1.py > tensorflow1_CPU.screenout
#echo "tensorflow1 CPU stop " `date` >> tests_time.txt


#conda activate GPU__tensorflow1
#echo "tensorflow1 GPU stop " `date` >> tests_time.txt
#python tensorflow1.py > tensorflow1_GPU.screenout
#echo "tensorflow1 GPU stop " `date` >> tests_time.txt


#echo "tensorflow2 PU start" `date` >> tests_time.txt
#echo "tensorflow2 GPU stop " `date` >> tests_time.txt


#conda activate CPU__pytorch
#echo "pytorch CPU start   " `date` >> tests_time.txt
#python pytorch.py --epochs 3 > pytorch_CPU.screenout
#echo "pytorch CPU stop    " `date` >> tests_time.txt
##################################################
#conda activate GPU__pytorch
#echo "pytorch GPU start   " `date` >> tests_time.txt
#python pytorch.py --epochs 3 > pytorch_GPU.screenout
#echo "pytorch GPU stop    " `date` >> tests_time.txt


## mini test 

echo "##########################  TENSORFLOW 2 CPU"
conda activate CPU__tensorflow2
python -c "import os; os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3';from tensorflow.python.client import device_lib; \
           a=device_lib.list_local_devices(); [print(x.name,x.physical_device_desc)  if x.device_type =='GPU' else print('no GPU device') for x  in a ]"

echo "##########################  TENSORFLOW 2 GPU"
conda activate GPU__tensorflow2
python -c "import os; os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3';from tensorflow.python.client import device_lib; \
           a=device_lib.list_local_devices(); [print(x.name,x.physical_device_desc)  if x.device_type =='GPU' else print('no GPU device') for x  in a ]"






echo "##########################  PYTORCH CPU"
conda activate CPU__pytorch
#python -c "import torch;a=torch.cuda.device_count();b=torch.cuda.get_device_name(); print(f'found {a} GPU, Name: {b}')"
python -c "import sys; sys.tracebacklimit = 0; import torch;a=torch.cuda.device_count();b=torch.cuda.get_device_name(); print(f'found {a} GPU, Name: {b}')"


echo "##########################  PYTORCH GPU"
conda activate GPU__pytorch
python -c "import sys; sys.tracebacklimit = 0; import torch;a=torch.cuda.device_count();b=torch.cuda.get_device_name(); print(f'found {a} GPU, Name: {b}')"




echo "##########################  TENSORFLOW 1 CPU"
conda activate CPU__tensorflow1
python -c "import os; os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3';from tensorflow.python.client import device_lib; \
           a=device_lib.list_local_devices(); [print(x.name,x.physical_device_desc)  if x.device_type =='GPU' else print('no GPU device') for x  in a ]"


echo "##########################  TENSORFLOW 1 GPU"
conda activate GPU__tensorflow1
python -c "import os; os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3';from tensorflow.python.client import device_lib; \
           a=device_lib.list_local_devices(); [print(x.name,x.physical_device_desc)  if x.device_type =='GPU' else print('no GPU device') for x  in a ]"

