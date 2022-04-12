# Using Ubuntu Focal 20.04 image as a base image
FROM ubuntu:20.04

# Docker package metadata
LABEL version="1.0" \
	maintainer="joao.salvado@protonmail.com" \
	description="Simple rectangular tesselation of a black and white map"

# Setup ubuntu and install libraries
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
  && apt-get install -y build-essential \
	gcc-9 \
	g++-9 \
	cmake \
	#libeigen3-dev \
	wget \
	unzip \
  libopencv-dev  \
  python3-opencv \
#  git \
#    pkg-config \
#    python-dev \ 
#    #python-opencv \ 
#    libopencv-dev \ 
#    #libav-tools  \ 
#    libjpeg-dev \ 
#    libpng-dev \ 
#    libtiff-dev \ 
#    #libjasper-dev \ 
#    libgtk2.0-dev \ 
#    python-numpy \ 
#    python-pycurl \ 
#    libatlas-base-dev \
#    gfortran \
#    webp \ 
#    qt5-default \
#    libvtk6-dev \ 
#    zlib1g-dev \
  && apt-get clean


# Install Open CV - Warning, this takes absolutely forever
#RUN mkdir -p ~/opencv cd ~/opencv && \
    #wget https://github.com/opencv/opencv/archive/3.0.0.zip && \
    #unzip 3.0.0.zip && \
    #rm 3.0.0.zip && \
    #mv opencv-3.0.0 OpenCV && \
    #cd OpenCV && \
    #mkdir build && \ 
    #cd build && \
    #cmake \
    #-DWITH_QT=ON \ 
    #-DWITH_OPENGL=ON \ 
    #-DFORCE_VTK=ON \
    #-DWITH_TBB=ON \
    #-DWITH_GDAL=ON \
    #-DWITH_XINE=ON \
    #-DBUILD_EXAMPLES=OFF .. && \
    #make -j20 && \
    #make install && \ 
    #ldconfig

COPY mr_env /mr_env

WORKDIR /mr_env/build
RUN cmake .. \
	&& make

#WORKDIR /mr_env/build/src
#CMD ["/bin/sh", "mrenv_exe"]
