FROM ubuntu:16.04

# update, upgrade, and install everything necessary
apt-get update
apt-get upgrade -y
apt-get install -y build-essential binutils

# set up dlang...
ADD https://dlang.org/install.sh /install.sh
RUN bash /install.sh
