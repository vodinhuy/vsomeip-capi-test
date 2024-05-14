#!/bin/bash
# set -e

## Install the dependencies
# sudo apt-get update
# sudo apt install -y build-essential
# sudo apt install -y cmake libexpat-dev expat default-jre


PROJECT_ROOT=$PWD
# git init
# git submodule add https://github.com/COVESA/vsomeip.git
# git submodule add https://github.com/COVESA/capicxx-someip-runtime.git
# git submodule add https://github.com/COVESA/capicxx-core-runtime.git
git submodule init
git submodule update

## Install Boost library
echo -e "\033[36m• Installing Boost library\033[0m"
wget https://github.com/boostorg/boost/releases/download/boost-1.85.0/boost-1.85.0-b2-nodocs.tar.gz
tar -xzvf boost-1.85.0-b2-nodocs.tar.gz
cd boost-1.85.0/
./bootstrap.sh && ./b2 install
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error: Install Boost"
    exit $retVal
fi

echo -e "\033[36m• Installing capicxx-core-runtime library\033[0m"
cd $PROJECT_ROOT/capicxx-core-runtime
mkdir -p build
cd build/
cmake .. && make install
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error: Install capicxx-core-runtime"
    exit $retVal
fi

echo -e "\033[36m• Installing vsomeip library\033[0m"
cd $PROJECT_ROOT/vsomeip
mkdir -p build
cd build/
cmake .. && make install
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error: Install vsomeip"
    exit $retVal
fi

echo -e "\033[36m• Installing capicxx-someip-runtime library\033[0m"
cd $PROJECT_ROOT/capicxx-someip-runtime
mkdir -p build
cd build/
cmake .. && make install
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error: Install capicxx-someip-runtime"
    exit $retVal
fi
