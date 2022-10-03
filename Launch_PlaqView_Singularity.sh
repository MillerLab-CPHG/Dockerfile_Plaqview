#!/bin/bash
# specify path to container
SIF=/project/cphg-millerlab/WeiMa/Project/PlaqView/Singularity/plaqviewmaster_stable_05122022.sif

# specify path to tmp directory created in previous section
TMPDIR=/project/cphg-millerlab/WeiMa/Project/PlaqView/Singularity # your choice

module load singularity
singularity exec \
    -B $TMPDIR/var/lib:/var/lib/rstudio-server \
    -B $TMPDIR/var/run:/var/run/rstudio-server \
    -B $TMPDIR/tmp:/tmp \
    $SIF \
    rserver --www-address=127.0.0.1 --server-user=$USER



# run the below ONCE
# TMPDIR=/project/cphg-millerlab/WeiMa/Project/PlaqView/Singularity # your choice
# mkdir -p $TMPDIR/tmp/rstudio-server
# uuidgen > $TMPDIR/tmp/rstudio-server/secure-cookie-key
# chmod 600 $TMPDIR/tmp/rstudio-server/secure-cookie-key
# mkdir -p $TMPDIR/var/{lib,run}