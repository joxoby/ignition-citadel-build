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

docker run -e BINTRAY_API_KEY=$BINTRAY_API_KEY --rm $DOCKER_USERNAME/ignition-citadel-builder /bin/bash -c "build.sh $ORG $REPO $BRANCH"
