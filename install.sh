# Install the dependencies
# sudo apt install -y cmake libexpat-dev expat default-jre


PROJECT_ROOT=$PWD
git init
git submodule add https://github.com/COVESA/vsomeip.git
git submodule add https://github.com/COVESA/capicxx-someip-runtime.git
git submodule add https://github.com/COVESA/capicxx-core-runtime.git

wget https://github.com/boostorg/boost/releases/download/boost-1.85.0/boost-1.85.0-b2-nodocs.tar.gz
tar -xzvf boost-1.85.0-b2-nodocs.tar.gz
cd boost-1.85.0/
./bootstrap.sh
./b2

cd $PROJECT_ROOT/capicxx-core-runtime
mkdir -p build
cd build/
cmake .. && make

cd $PROJECT_ROOT/vsomeip
mkdir -p build
cd build/
cmake .. -DCMAKE_INSTALL_PREFIX=$PROJECT_ROOT/boost-1.85.0/stage/lib/cmake/Boost-1.85.0 && make

cd $PROJECT_ROOT/capicxx-someip-runtime
mkdir -p build
cd build/
cmake .. -DCMAKE_INSTALL_PREFIX=$PROJECT_ROOT/vsomeip/build && make
