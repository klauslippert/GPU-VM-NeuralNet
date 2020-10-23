# GIT

# Anaconda Python 

#wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh -O Anaconda3.sh
#chmod u+x Anaconda3.sh
#./Anaconda3.sh -b -p $HOME/anaconda3
#~/anaconda3/bin/conda init bash
#source ~/.bashrc

# create environments

#conda create -n tensorflow1-cpu python=3 -y
#conda install -n tensorflow1-cpu tensorflow==1.15 -y

#conda create -n tensorflow2-cpu  python=3 -y
#conda install -n tensorflow2-cpu tensorflow -y

#conda create -n pytorch-cpu python=3 -y
#conda install -n pytorch-cpu pytorch torchvision cpuonly -c pytorch -y


#conda create -n tensorflow1-gpu python=3 -y
#conda install -n tensorflow1-gpu tensorflow-gpu==1.15 -y


conda create -n tensorflow2-gpu  python=3 -y
conda install -n tensorflow2-gpu tensorflow-gpu -y

conda create -n pytorch-gpu python=3 -y
conda install -n pytorch-gpu pytorch torchvision  -c pytorch -y



conda env list

