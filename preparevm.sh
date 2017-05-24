#!/bin/sh

command -v VBoxManage >/dev/null 2>&1 || {
  echo >&2 "I require VirtualBox but it's not installed.  Get it at https://www.virtualbox.org/wiki/Downloads"; exit 1;
}
command -v vagrant >/dev/null 2>&1 || {
  echo >&2 "I require Vagrant but it's not installed.  https://www.vagrantup.com/downloads.html"; exit 1;
}

echo >&2 "Fetching Summer School Virtual Machine (VM)."
if [[ ! -f fermi.17.0.1.box ]]; then
  wget ftp://heasarc.nasa.gov/fermi/software/Summer_School_2017/fermi.17.01.box
fi
echo >&2 "Fetching galactic diffuse file."
if [[ ! -f gll_iem_v06.fits ]]; then
  wget ftp://heasarc.nasa.gov/fermi/software/Summer_School_2017/gll_iem_v06.fits
fi

vagrant box remove fermi-box
vagrant box add fermi-box fermi.17.01.box
vagrant up

exit 0;
