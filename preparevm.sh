#!/bin/bash

command -v VBoxManage >/dev/null 2>&1 || {
  echo >&2 "I require VirtualBox but it's not installed.  Get it at https://www.virtualbox.org/wiki/Downloads"; exit 1;
}
command -v vagrant >/dev/null 2>&1 || {
  echo >&2 "I require Vagrant but it's not installed.  https://www.vagrantup.com/downloads.html"; exit 1;
}

dlget=wget
command -v $dlget >/dev/null 2>&1 || { $dlget=curl; }
command -v $dlget >/dev/null 2>&1 || {
  echo >&2 "I need a way to download files, but I cannot find wget or curl. Please download one."
}

echo >&2 "Fetching Summer School Virtual Machine (VM)."
vmfile=./fermi.17.01.box
if [ ! -f "$vmfile" ]; then
  $dlget ftp://heasarc.nasa.gov/fermi/software/Summer_School_2017/"$vmfile"
fi
echo >&2 "Fetching galactic diffuse file."
file=./gll_iem_v06.fits
if [ ! -f "$file" ]; then
  $dlget ftp://heasarc.nasa.gov/fermi/software/Summer_School_2017/"$file"
fi
echo >&2 "Fetching isotropic diffuse file."
file=./iso_P8R2_SOURCE_V6_v06.txt
if [ ! -f "$file" ]; then
  $dlget https://fermi.gsfc.nasa.gov/ssc/data/analysis/software/aux/"$file"
fi

vagrant box remove fermi-box
vagrant box add fermi-box "$vmfile"
vagrant up

exit 0;

