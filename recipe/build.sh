#!/usr/bin/env bash

mkdir build && cd build

# Make libraries
cmake                                          \
  -DCMAKE_BUILD_TYPE=Release                   \
  -DCMAKE_CXX_FLAGS='-O3 -std=c++17'           \
  -DCMAKE_C_FLAGS='-O3'                        \
  -DCMAKE_INSTALL_PREFIX:PATH=${PREFIX}        \
  -DEIGEN_INCLUDE_DIR=${PREFIX}/include/eigen3 \
  -DCMAKE_PREFIX_PATH=${PREFIX}                \
  -DBoost_DIR=${PREFIX}/lib                    \
  -DBoost_INCLUDE_DIR:PATH=${PREFIX}/include   \
  -DLIBNABO_INSTALL_DIR=${PREFIX}              \
  -DBUILD_SHARED_LIBS=ON                       \
  -DCMAKE_VERBOSE_MAKEFILE=ON                  \
  -DBoost_NO_BOOST_CMAKE=OFF                   \
  -DCMAKE_VERBOSE_MAKEFILE=ON                  \
  -DBoost_DEBUG=ON                             \
  -DBoost_DETAILED_FAILURE_MSG=ON              \
  -DCMAKE_CXX_COMPILER_ARCHITECTURE_ID=x64     \
  -DBoost_NO_SYSTEM_PATHS=ON                   \
  ${SRC_DIR}

make -j $CPU_COUNT
make install

