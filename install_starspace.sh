#!/bin/bash
wget https://dl.bintray.com/boostorg/release/1.63.0/source/boost_1_63_0.zip
unzip boost_1_63_0.zip
mv boost_1_63_0 /usr/local/bin
rm boost_1_63_0.zip
git clone https://github.com/facebookresearch/Starspace.git
cd Starspace
make && make query_predict && make query_nn
