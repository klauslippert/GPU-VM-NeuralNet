source ~/anaconda3/etc/profile.d/conda.sh
##
## download tests

# tensorflow1

# tensorflow2

# pytorch
wget https://raw.githubusercontent.com/pytorch/examples/master/mnist/main.py -O pytorch.py
# adopt the data folder
sed -i 's#../data#./data#g' pytorch.py


echo "tensorflow CPU start" `date`  > tests_time.txt
echo "tensorflow CPU stop " `date` >> tests_time.txt
echo "tensorflow GPU start" `date` >> tests_time.txt
echo "tensorflow GPU stop " `date` >> tests_time.txt


conda activate CPU__pytorch
echo "pytorch CPU start   " `date` >> tests_time.txt
python pytorch.py --epochs 3 > pytorch_CPU.screenout
echo "pytorch CPU stop    " `date` >> tests_time.txt
##################################################
conda activate GPU__pytorch
echo "pytorch GPU start   " `date` >> tests_time.txt
python pytorch.py --epochs 3 > pytorch_GPU.screenout
echo "pytorch GPU stop    " `date` >> tests_time.txt


