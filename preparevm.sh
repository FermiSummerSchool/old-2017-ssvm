#!/bin/bash

command -v VBoxManage >/dev/null 2>&1 || {
  echo >&2 "I require VirtualBox but it's not installed.  Get it at https://www.virtualbox.org/wiki/Downloads"; exit 1;
}
command -v vagrant >/dev/null 2>&1 || {
  echo >&2 "I require Vagrant but it's not installed.  https://www.vagrantup.com/downloads.html"; exit 1;
}

dlget=wget
command -v $dlget >/dev/null 2>&1 || {
  echo >&2 "I need wget to download files, but I cannot find it. Please download wget."
}

vmfile=./fermi.17.01.box
if [ ! -f "$vmfile" ]; then
  echo >&2 "Fetching Summer School Virtual Machine (VM).";
  $dlget ftp://heasarc.nasa.gov/fermi/software/Summer_School_2017/"$vmfile"
fi
file=./gll_iem_v06.fits
if [ ! -f "$file" ]; then
  echo >&2 "Fetching galactic diffuse file.";
  $dlget ftp://heasarc.nasa.gov/fermi/software/Summer_School_2017/"$file"
fi
file=./iso_P8R2_SOURCE_V6_v06.txt
if [ ! -f "$file" ]; then
  echo >&2 "Fetching isotropic diffuse file.";
  $dlget https://fermi.gsfc.nasa.gov/ssc/data/analysis/software/aux/"$file"
fi

command -v vagrant status default >/dev/null 2>&1 || {
  echo >&2 "A default vm already exists in this directory. Please destroy it with vagrant destroy and run preparevm.sh again."; exit 1;
}
vagrant box add --force fermi-box "$vmfile"
vagrant up --destroy-on-error

exit 0;

