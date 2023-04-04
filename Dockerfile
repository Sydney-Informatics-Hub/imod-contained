
# Build with:
# sudo docker build . -t nbutter/imod

# Run with e.g.:
# xhost +
# sudo docker run --gpus all -it --rm -v `pwd`:/project -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY nbutter/imod
# imod

FROM nvidia/cuda:10.2-cudnn8-devel-centos7

RUN yum -y update && yum clean all && yum -y makecache && yum -y groupinstall "Development Tools"
RUN yum -y install epel-release python3 tcsh java-1.8.0-openjdk wget libGLU qt5-qtbase-devel libxkbcommon-x11

# Link python3 so imod can find it
RUN mkdir /opt/bin
ENV PATH=/opt/bin/:$PATH
RUN ln -s /usr/bin/python3 /opt/bin/python

WORKDIR /project
# The download is slow, so just add it in
# RUN wget https://bio3d.colorado.edu/ftp/latestIMOD/RHEL7-64_CUDA10.1/imod_4.12.40_RHEL7-64_CUDA10.1.sh
ADD imod_4.12.40_RHEL7-64_CUDA10.1.sh /project/
RUN sh imod_4.12.40_RHEL7-64_CUDA10.1.sh -yes 

RUN mkdir /scratch && touch /usr/bin/nvidia-smi
