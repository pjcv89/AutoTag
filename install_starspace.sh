#!/bin/bash
git clone https://github.com/facebookresearch/Starspace.git
cd Starspace
make && make query_predict && make query_nn
