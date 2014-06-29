!#/bin/bash

#
# Environment setup for scientific computing on Ubuntu 12.04 (Elementary OS Luna)
#

# Keepass
apt-add-repository ppa:jtaylor/keepass
apt-get-update
apt-get install keepass2

# Sublime Text 2
add-apt-repository ppa:webupd8team/sublime-text-2
apt-get update
apt-get install sublime-text

# Git
apt-get install git

# Compilers 
apt-get install gcc g++ gfortran

# Linear algebra libraries 
# Remove ATLAS in case it is already installed and then install OPENBLAS and LAPACK
# apt-get remove libopenblas-base libatlas3gf-base libatlas-dev
apt-get install libopenblas-dev liblapack-dev

# Python 
apt-get install python python-pip python-dev
pip install -U pip
pip install ipython[notebook]
pip install distribute --upgrade
apt-get build-dep python-matplotlib
pip install numpy scipy matplotlib pandas sympy nose

# Theano (deeplearning.net)
pip install Theano

# Upgrade essential modules to latest versions
pip install --upgrade numpy
pip install --upgrade scipy
pip install --upgrade --no-deps theano

# CUDA
# http://docs.nvidia.com/cuda/cuda-getting-started-guide-for-linux/#axzz35vR0huAR
# Verify graphics card: lspci | grep -i nvidia
# To check if supported it must be listed here: https://developer.nvidia.com/cuda-gpus
# Verify Linux version: uname -m && cat /etc/*release
# Verify gcc is installed (of course...): gcc --version

# Uninstall official driver if available (incompatible)
#/usr/bin/nvidia-uninstall

# Optional: enable armhf foreign architecture for cross armhf toolkit
# sudo sh -c \ 'echo "foreign-architecture armhf" >> /etc/dpkg/dpkg.cfg.d/multiarch' 
# sudo apt-get update

# Dowanload and install package (.deb file) with metadata 
# (pick correct one at http://developer.nvidia.com/cuda-downloads)
export CUDA_REP_NAME=cuda-repo-ubuntu1204_6.0-37_i386.deb
#export CUDA_REP_NAME=cuda-repo-ubuntu1204_6.0-37_amd64.deb
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1204/i386/${CUDA_REP_NAME}

dpkg -i ${CUDA_REP_NAME}
apt-get update
rm ${CUDA_REP_NAME}

apt-get install cuda


# Configure Theano to use GPU 
# Add these to the .profile
export CUDA_ROOT=/usr/local/cuda-6.0
export PATH=${PATH}:${CUDA_ROOT}/bin
export LD_LIBRARY_PATH=${CUDA_ROOT}/lib:${LD_LIBRARY_PATH}
export THEANO_FLAGS='cuda.root=${CUDA_ROOT},device=gpu,floatX=float32'

# Testing
python -c "import numpy; numpy.test()"
python -c "import scipy; scipy.test()"

python -c "import theano; theano.test()"

# Testing for speed
python `python -c "import os, theano; print os.path.dirname(theano.__file__)"`/misc/check_blas.py
# Plynsy CPU: Total execution time: 13.28s on CPU (with direct Theano binding to blas).
# Laptop CPU: Total execution time: 12.05s on CPU (with direct Theano binding to blas).
# GeForce 210: Total execution time: 6.36s on CPU (with direct Theano binding to blas).

# Get Data from Kaggle
# http://www.kaggle.com/c/higgs-boson/data

# Check out source code from git 

# Start working!!!!