#!/bin/bash

ftpsite="ftp://heasarc.nasa.gov/fermi/software/Summer_School_2017/"
bzfile=./tempo2_patch.tar.bz2
if [ ! -f "/vagrant/$bzfile" ]; then
  cd /vagrant;
  echo "Fetching $bzfile";
  wget $ftpsite/$bzfile;
fi
echo "Extracting $bzfile"
tar jxf /vagrant/$bzfile -C /
hash -r
echo "Done!"
exit 0;
