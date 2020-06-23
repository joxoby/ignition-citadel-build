#!/bin/bash
set -o errexit
set -o verbose

bash build.sh bash build.sh ignitionrobotics ign-cmake ign-cmake2
cp *.deb ign-cmake.deb
curl -T ign-cmake.deb -u joxoby:$BINTRAY_API_KEY https://api.bintray.com/content/joxoby/ignition-citadel/ign-cmake/dev/ign-cmake;deb_distribution=bionic;deb_component=main;deb_architecture=amd64

