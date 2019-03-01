#!/bin/sh

if [ -d "menhir" ]; then 
	exit 0
fi

mkdir menhir
cd menhir
wget https://gitlab.inria.fr/fpottier/menhir/-/archive/20181113/menhir-20181113.tar
tar -xf menhir-20181113.tar
cd menhir-20181113
./configure
make


