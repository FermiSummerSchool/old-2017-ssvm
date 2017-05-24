#!/bin/sh

command -v VBoxManage >/dev/null 2>&1 || {
  echo >&2 "I require VirtualBox but it's not installed.  Get it at https://www.virtualbox.org/wiki/Downloads"; exit 1;
}
command -v vagrant >/dev/null 2>&1 || {
  echo >&2 "I require Vagrant but it's not installed.  https://www.vagrantup.com/downloads.html"; exit 1;
}

echo >&2 "Fetching Summer School Virtual Machine (VM)."
wget ftp://heasarc.nasa.gov/fermi/software/Summer_School_2017/fermi.17.01.box

vagrant box remove fermi-box
vagrant box add fermi-box fermi.17.01.box
vagrant up

exit 0;
