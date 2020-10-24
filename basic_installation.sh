#/bin/bash

# needed: GIT, openssh

######################################
# this has to go to a seperate script:
# Install Anaconda Python 3
######################################

#wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh -O Anaconda3.sh
#chmod u+x Anaconda3.sh
#./Anaconda3.sh -b -p $HOME/anaconda3
#~/anaconda3/bin/conda init bash

######################################
# this has to go to a seperate script:
# environments and libraries
######################################

# create environments for CPU
#conda create -n CPU__tensorflow1 python=3 -y
#conda create -n CPU__tensorflow2  python=3 -y
#conda create -n CPU__pytorch python=3 -y

# create environments for GPU
#conda create -n GPU__tensorflow1 python=3 -y
#conda create -n GPU__tensorflow2  python=3 -y
#conda create -n GPU__pytorch python=3 -y

# install NeuralNet libraries for CPU
#conda install -n CPU__tensorflow1 tensorflow==1.15 -y
#conda install -n CPU__tensorflow2 tensorflow -y
#conda install -n CPU__pytorch pytorch torchvision cpuonly -c pytorch -y

# install NeuralNet libraries for GPU
#conda install -n GPU__tensorflow1 tensorflow-gpu==1.15 -y
#conda install -n GPU__tensorflow2 tensorflow-gpu -y
#conda install -n GPU__pytorch pytorch torchvision  -c pytorch -y


######################################
# this has to go to a seperate script:
# jupyter notebook
######################################
source ~/anaconda3/etc/profile.d/conda.sh


# let you change the kernels in jupyter notebook
#conda install -n CPU__tensorflow1 jupyter -y
#conda activate CPU__tensorflow1
#python -m ipykernel install --name CPU__tensorflow1 --user
#################
#conda install -n CPU__tensorflow2 jupyter -y
#conda activate CPU__tensorflow2
#python -m ipykernel install --name CPU__tensorflow2 --user
#################
#conda install -n CPU__pytorch jupyter -y
#conda activate CPU__pytorch
#python -m ipykernel install --name CPU__pytorch --user
#################
#conda install -n GPU__tensorflow1 jupyter -y
#conda activate GPU__tensorflow1
#python -m ipykernel install --name GPU__tensorflow1 --user
#################
#conda install -n GPU__tensorflow2 jupyter -y
#conda activate GPU__tensorflow2
#python -m ipykernel install --name GPU__tensorflow2 --user
#################
#conda install -n GPU__pytorch jupyter -y
#conda activate GPU__pytorch
#python -m ipykernel install --name GPU__pytorch --user
#################

conda install -n GPU__pytorch matplotlib -y



# ??? # make the jupyter notebook accessable from outside


######################################
# this has to go to a separate script:
# running and comparing tests
######################################

# get MNIST dataset

# start file for measuring

# run tests

