FROM ubuntu:18.04

RUN apt install curl wget
RUN sh -c 'echo "deb [arch=amd64,arm64] http://repo.ros2.org/ubuntu/main `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt update
RUN apt install python3-colcon-common-extensions
RUN pip install vcstool
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
RUN http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
RUN apt-get update
RUN wget https://raw.githubusercontent.com/ignitionrobotics/ign-gazebo/master/docker/scripts/install_common_deps.sh
RUN wget https://raw.githubusercontent.com/ignitionrobotics/ign-gazebo/master/docker/scripts/install_ign_deps.sh
RUN bash install_common_deps.sh
RUN bash install_ign_deps.sh
