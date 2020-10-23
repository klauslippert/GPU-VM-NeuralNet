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
#source ~/.bashrc

######################################
# this has to go to a seperate script:
# environments and libraries
######################################

# create environments for CPU
#conda create -n tensorflow1-cpu python=3 -y
#conda create -n tensorflow2-cpu  python=3 -y
#conda create -n pytorch-cpu python=3 -y

# create environments for GPU
#conda create -n tensorflow1-gpu python=3 -y
#conda create -n tensorflow2-gpu  python=3 -y
#conda create -n pytorch-gpu python=3 -y

# install NeuralNet libraries for CPU
#conda install -n tensorflow1-cpu tensorflow==1.15 -y
#conda install -n tensorflow2-cpu tensorflow -y
#conda install -n pytorch-cpu pytorch torchvision cpuonly -c pytorch -y

# install NeuralNet libraries for GPU
#conda install -n tensorflow1-gpu tensorflow-gpu==1.15 -y
#conda install -n tensorflow2-gpu tensorflow-gpu -y
#conda install -n pytorch-gpu pytorch torchvision  -c pytorch -y


######################################
# this has to go to a seperate script:
# jupyter notebook
######################################

# let you change the kernels in jupyter notebook

# ??? # make the jupyter notebook accessable from outside


######################################
# this has to go to a separate script:
# running and comparing tests
######################################

# get MNIST dataset

# start file for measuring

# run tests

