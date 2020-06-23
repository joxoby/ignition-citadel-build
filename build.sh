#!/bin/bash
# Command line parameters:
# 1 - github organization name. For example ignitionrobotics or osrf.
# 2 - the name of the ignition repository. For example ign-math.
# 3 - the name of the branch. For example ign-math6

set -o errexit
set -o verbose

ORG=$1
REPO=$2
BRANCH=$3

DEB_FILENAME=$BRANCH
DEB_PACKAGE_NAME=$REPO

git clone https://github.com/$ORG/REPO -b $BRANCH
cd $2 
mkdir build
cd build
cmake ../
make -j4
make test
make package
cp *.deb $DEB_FILENAME
bash deploy.sh $DEB_FILENAME $DEB_PACKAGE_NAME

