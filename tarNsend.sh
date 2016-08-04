#!/bin/sh
#$ backup source-path-name

# Get the path name for the source
source_path_name=$1
echo $source_path_name


# Collect files in a encryptated and compressed tarballi
date_string=$(date '+%Y-%m-%d_%H:%M:%S')
tar_archive="/tmp/sclone_${date_string}.tar"

echo tar_archive=$tar_archive
tar -vcf $tar_archive $source_path_name --exclude='*/\@eaDir*'
ls /tmp/sclone_*


# Send tarball to the cloud using rclone
./rclone copy $tar_archive remote:default/backup_${date_string}
