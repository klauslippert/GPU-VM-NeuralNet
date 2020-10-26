#/bin/bash

########################################################################################

function install_anaconda {

	echo " "
	echo "#####################################"
	echo "  Install Anaconda Python 3"
	echo "#####################################"
	echo `date`
	echo " "

	wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh -O Anaconda3.sh
	chmod u+x Anaconda3.sh
	./Anaconda3.sh -b -p $HOME/anaconda3
	~/anaconda3/bin/conda init bash

	echo " "
	echo `date` "done"

}

########################################################################################

function create_environments {

	echo " "
	echo "#####################################"
	echo "  Install Python environments"
	echo "#####################################"
	echo `date`
	echo " "

	# for CPU
	conda create -n CPU__tensorflow1 python=3 -y
	conda create -n CPU__tensorflow2  python=3 -y
	conda create -n CPU__pytorch python=3 -y

	# for GPU
	conda create -n GPU__tensorflow1 python=3 -y
	conda create -n GPU__tensorflow2  python=3 -y
	conda create -n GPU__pytorch python=3 -y

        # show environments
	source ~/anaconda3/etc/profile.d/conda.sh
        conda env list

	echo " "
	echo `date` "done"

}

########################################################################################

function install_libraries {

	echo " "
	echo "#####################################"
	echo "  Install libraries for Neural Nets"
	echo "#####################################"
	echo `date`
	echo " "

	# for CPU
	conda install -n CPU__tensorflow1 tensorflow==1.15 -y
	conda install -n CPU__tensorflow2 tensorflow -y
	conda install -n CPU__pytorch pytorch torchvision cpuonly -c pytorch -y

	# for GPU
	conda install -n GPU__tensorflow1 tensorflow-gpu==1.15 -y
	conda install -n GPU__tensorflow2 tensorflow-gpu -y
	conda install -n GPU__pytorch pytorch torchvision  -c pytorch -y

	echo " "
	echo `date` "done"

}

########################################################################################

function install_jupyter {

	echo " "
	echo "#####################################"
	echo "  Install jupyter notebook"
	echo "       in all environments"
	echo "#####################################"
	echo `date`
	echo " "

	# jupyter notebook in all env
	conda install -n CPU__tensorflow1 jupyter -y
	conda install -n CPU__tensorflow2 jupyter -y
	conda install -n CPU__pytorch jupyter -y

	conda install -n GPU__tensorflow1 jupyter -y
	conda install -n GPU__tensorflow2 jupyter -y
	conda install -n GPU__pytorch jupyter -y

	# let you change the kernels in jupyter notebook
	source ~/anaconda3/etc/profile.d/conda.sh

	conda activate CPU__tensorflow1
	python -m ipykernel install --name CPU__tensorflow1 --user
	conda activate CPU__tensorflow2
	python -m ipykernel install --name CPU__tensorflow2 --user
	conda activate CPU__pytorch
	python -m ipykernel install --name CPU__pytorch --user

	conda activate GPU__tensorflow1
	python -m ipykernel install --name GPU__tensorflow1 --user
	conda activate GPU__tensorflow2
	python -m ipykernel install --name GPU__tensorflow2 --user
	conda activate GPU__pytorch
	python -m ipykernel install --name GPU__pytorch --user

        echo "you can start now 'jupyter notebook' in env 'base' and access all kernels"
        echo 'locally:     jupyter notebook -p 8888'
        echo 'from remote: jupyter notebook -ip "0.0.0.0" -p 8888'

	echo " "
	echo `date` "done"

}

########################################################################################

function run_small_tests {

	echo " "
	echo "#####################################"
	echo "  run small tests:"
	echo "    access GPU from every environment"
	echo "#####################################"
	echo `date`
	echo " "

	source ~/anaconda3/etc/profile.d/conda.sh

	echo "##### TENSORFLOW 1 CPU"
	conda activate CPU__tensorflow1
	python -c "import os; os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3';from tensorflow.python.client import device_lib; \
                   a=device_lib.list_local_devices(); [print(x.name,x.physical_device_desc)  \
                   if x.device_type =='GPU' else print('no GPU device') for x  in a ]"
	echo "##### TENSORFLOW 1 GPU"
	conda activate GPU__tensorflow1
	python -c "import os; os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3';from tensorflow.python.client import device_lib; \
                   a=device_lib.list_local_devices(); [print(x.name,x.physical_device_desc)  \
                   if x.device_type =='GPU' else print('no GPU device') for x  in a ]"

	echo "##### TENSORFLOW 2 CPU"
	conda activate CPU__tensorflow2
	python -c "import os; os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3';from tensorflow.python.client import device_lib; \
	           a=device_lib.list_local_devices(); [print(x.name,x.physical_device_desc)  \
                   if x.device_type =='GPU' else print('no GPU device') for x  in a ]"
	echo "##### TENSORFLOW 2 GPU"
	conda activate GPU__tensorflow2
	python -c "import os; os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3';from tensorflow.python.client import device_lib; \
        	   a=device_lib.list_local_devices(); [print(x.name,x.physical_device_desc) \
		   if x.device_type =='GPU' else print('no GPU device') for x  in a ]"

	echo "##### PYTORCH CPU"
	conda activate CPU__pytorch
	python -c "import sys; sys.tracebacklimit = 0; import torch;a=torch.cuda.device_count();\
                   b=torch.cuda.get_device_name(); print(f'found {a} GPU, Name: {b}')"
	echo "##### PYTORCH GPU"
	conda activate GPU__pytorch
	python -c "import sys; sys.tracebacklimit = 0; import torch;a=torch.cuda.device_count();\
		   b=torch.cuda.get_device_name(); print(f'found {a} GPU, Name: {b}')"


	echo " "
	echo `date` "done"

}

########################################################################################

function run_extended_tests {

	echo " "
	echo "#####################################"
	echo "  run extended tests:"
	echo "    handwritting digit recognition "
	echo "    with MNIST dataset"
	echo "#####################################"
	echo `date`
	echo " "

	echo " " > tests_time.txt

	echo "##### PYTORCH"
	wget https://raw.githubusercontent.com/pytorch/examples/master/mnist/main.py -O pytorch.py
	sed -i 's#../data#./data#g' pytorch.py		# adopt the data folder
	# CPU
	conda activate CPU__pytorch
	echo "pytorch CPU start   " `date` >> tests_time.txt
	python pytorch.py --epochs 3 > pytorch_CPU.screenout
	echo "pytorch CPU stop    " `date` >> tests_time.txt
	# GPU
        conda activate GPU__pytorch
	echo "pytorch GPU start   " `date` >> tests_time.txt
	python pytorch.py --epochs 3 > pytorch_GPU.screenout
	echo "pytorch GPU stop    " `date` >> tests_time.txt




	echo "##### TENSORFLOW 1"
	wget https://raw.githubusercontent.com/aymericdamien/TensorFlow-Examples/master/tensorflow_v1/examples/3_NeuralNetworks/neural_network.py -O tensorflow1.py
	sed -i 's#/tmp/data#./data#g' tensorflow1.py
	sed -i 's#num_steps = 1000#num_steps = 100000#g' tensorflow1.py

        # CPU
	conda activate CPU__tensorflow1
	echo "tensorflow1 CPU start" `date` >> tests_time.txt
	python tensorflow1.py > tensorflow1_CPU.screenout
	echo "tensorflow1 CPU stop " `date` >> tests_time.txt
	# GPU
	conda activate GPU__tensorflow1
	echo "tensorflow1 GPU start " `date` >> tests_time.txt
	python tensorflow1.py > tensorflow1_GPU.screenout
	echo "tensorflow1 GPU stop " `date` >> tests_time.txt

	echo "##### TENSORFLOW 2"
	#wget
	#sed
	# CPU
	#conda activate CPU__tensorflow2
	echo "tensorflow2 CPU start" `date` >> tests_time.txt
	#python tensorflow2.py > tensorflow2_CPU.screenout
	echo "tensorflow2 CPU stop " `date` >> tests_time.txt
	# GPU
	#conda activate GPU__tensorflow2
	echo "tensorflow2 GPU stop " `date` >> tests_time.txt
	#python tensorflow2.py > tensorflow2_GPU.screenout
	echo "tensorflow2 GPU stop " `date` >> tests_time.txt

	echo " "
	echo `date` "done"

	less tests_time.txt

}




########################################################################################


# requirement: GIT


#install_anaconda
#create_environments
#install_libraries
#install_jupyter      # optional

#run_small_tests
run_extended_tests


# the extended tests are not really comparable
# 2do: - wget: point to a specific commit for each example
#      - check the data size in each test
#      - adjust the number of epochs / steps to each other
#      - tensorflow1 gpu is only a little bit faster then CPU.. why?




