#!/bin/bash

VERSION="1.2"

echo -e "calling docker build --rm=true -t compbio/prsice:${VERSION} ."

docker build --rm=true -t compbio/prsice:${VERSION} .
