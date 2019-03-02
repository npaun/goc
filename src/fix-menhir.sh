#!/bin/sh

MENHIR_DIR="$(dirname $0)/menhir"
MENHIR_VERSION="20181113"

if [ -d $MENHIR_DIR ]; then 
	exit 0
fi

echo "Please wait we are downloading a new copy of menhir to make sure there are no problems"
echo "This takes a minute or two"

wget https://gitlab.inria.fr/fpottier/menhir/-/archive/$MENHIR_VERSION/menhir-$MENHIR_VERSION.tar
tar -xf menhir-$MENHIR_VERSION.tar
mv menhir-$MENHIR_VERSION/ $MENHIR_DIR
cd $MENHIR_DIR
make PREFIX=.
make PREFIX=. install

echo "All done!"
