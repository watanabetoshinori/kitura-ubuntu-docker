##
# Copyright IBM Corporation 2016
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

# Dockerfile to build a Docker image with all the dependencies to build and run
# the Kitura sample application.

FROM ibmcom/swift-ubuntu:latest
MAINTAINER IBM Swift Engineering at IBM Cloud
LABEL Description="Image to create a Linux image with the all the dependencies to build and run the Kitura sample app."

# Expose default port for Kitura
EXPOSE 8090

# Variables
ENV HOME /root
ENV WORK_DIR /root

# Useful linux system utilities
RUN apt-get install telnet

# Download regular expression library
RUN wget http://ftp.exim.org/pub/pcre/pcre2-10.20.tar.gz
RUN tar xvfz pcre2-10.20.tar.gz
RUN cd pcre2-10.20 && ./configure && make && make install

# Download build Swift Package Manager
# (this is only needed if the latest swift binary does not have the latest SPM)
# RUN git clone -b master https://github.com/apple/swift-package-manager.git
# RUN ./swift-package-manager/Utilities/bootstrap --prefix $WORK_DIR/$SWIFT_SNAPSHOT-$UBUNTU_VERSION/usr install

# Add build files to image
ADD ci.sh /root
ADD build_kitura.sh /root
ADD test_kitura.sh /root
ADD start_kitura_sample.sh /root

USER root
CMD /root/ci.sh
