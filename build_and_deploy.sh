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

DEB_PACKAGE=$BRANCH

# Build and test
git clone https://github.com/$ORG/$REPO -b $BRANCH
cd $2 
mkdir build
cd build
cmake ../
make -j4
make test
make package

FILE="$DEB_PACKAGE.deb"
cp *.deb $FILE

# Deploy
curl -T $FILE -u joxoby:$BINTRAY_API_KEY https://api.bintray.com/content/joxoby/ignition-citadel/$DEB_PACKAGE/dev/$DEB_PACKAGE;deb_distribution=bionic;deb_component=main;deb_architecture=amd64

