#!/bin/bash
# Command line parameters:
# 1 - github organization name. For example ignitionrobotics or osrf.
# 2 - the name of the ignition repository. For example ign-math.
# 3 - the name of the branch. For example ign-math6

set -o errexit
set -o verbose

git clone https://github.com/$1/$2 -b $3
cd $2 
mkdir build
cd build
cmake ../
make -j4
make test
make package
cp *.deb $3
./deploy.sh $3 $2

