#!/bin/bash
set -o errexit
set -o verbose

FILE=$1
PACKAGE=$2

curl -T $FILE -u joxoby:$BINTRAY_API_KEY https://api.bintray.com/content/joxoby/ignition-citadel/$PACKAGE/dev/$PACKAGE;deb_distribution=bionic;deb_component=main;deb_architecture=amd64
