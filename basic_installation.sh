# GIT

# Anaconda Python + create environments

wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh -O Anaconda3.sh


chmod u+x Anaconda3.sh
./Anaconda3.sh -b -p $HOME/anaconda3
~/anaconda3/bin/conda init
source ~/.bashrc

conda create --name tensorflow1-cpu python=3 -y
conda activate tensorflow1-cpu
conda install tensorflow==1.15 -y

conda create --name tensorflow2-cpu  python=3 -y
conda activate tensorflow2-cpu
conda install tensorflow -y

conda create --name pytorch-cpu python=3 -y
conda activate pytorch-cpu
conda install pytorch torchvision cpuonly -c pytorch -y


