#!/bin/bash
#This is required to build the stuff

set -eu pipefail

#Add here what kind of dependencies you need in general
apt-get update
apt-get install -y make automake gcc build-essential g++ cpp libc6-dev man-db autoconf pkg-config wget unzip python-pip python-dev
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -b -p /usr/bin/miniconda
export PATH="/usr/bin/miniconda/bin:$PATH"
#install conda and qiime1
wget https://data.qiime2.org/distro/core/qiime2-2018.2-py35-linux-conda.yml
conda env create -n qiime2-2018.2 --file qiime2-2018.2-py35-linux-conda.yml
# OPTIONAL CLEANUP
rm qiime2-2018.2-py35-linux-conda.yml

#The actual tool installation should be done in the Singularity file itself to make the entire thing portable! 
