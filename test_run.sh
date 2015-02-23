#!/bin/bash

## run compbio/prsice:1.2
#
docker \
run \
--rm=true \
-v ${HOME}/pgrs:/home/pipeman \
-w /home/pipeman \
-e HOME=/home/pipeman \
-e USER=pipeman \
--user pipeman \
--name prsice \
-i \
-t compbio/prsice:1.2 R -q --file=/usr/local/bin/PRSice_v1.2.R --args \
plink /usr/local/bin/plink1.9_x86_64 \
base /usr/local/bin/TOY_BASE_GWAS.assoc \
target /usr/local/bin/TOY_TARGET_DATA \
slower 0 supper 0.5 sinc 0.01 covary F \
figname /home/pipeman/EXAMPLE_1
