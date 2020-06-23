FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="America/Los_Angeles"
RUN apt-get update
RUN apt-get install -y ca-certificates gnupg2 curl wget lsb-release python3.6 python3-pip tzdata sudo
RUN sh -c 'echo "deb [arch=amd64,arm64] http://repo.ros2.org/ubuntu/main `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y python3-colcon-common-extensions
RUN pip3 install vcstool
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
RUN apt-get update
RUN wget https://raw.githubusercontent.com/ignitionrobotics/ign-gazebo/master/docker/scripts/install_common_deps.sh
RUN wget https://raw.githubusercontent.com/ignitionrobotics/ign-gazebo/master/docker/scripts/install_ign_deps.sh
RUN bash install_common_deps.sh
RUN bash install_ign_deps.sh
COPY build.sh build.sh
COPY deploy.sh deploy.sh
