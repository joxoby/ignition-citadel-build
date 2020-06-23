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

# Build and test
git clone https://github.com/$ORG/$REPO -b $BRANCH
cd $2 
mkdir build
cd build
cmake ../
make -j4
make test
make package
cp *.deb $DEB_FILENAME

# Deploy
FILE=$DEB_FILENAME
PACKAGE=$DEB_PACKAGE_NAME
curl -T $FILE -u joxoby:$BINTRAY_API_KEY https://api.bintray.com/content/joxoby/ignition-citadel/$PACKAGE/dev/$PACKAGE;deb_distribution=bionic;deb_component=main;deb_architecture=amd64

