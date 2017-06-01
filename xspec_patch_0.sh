#!/bin/bash

command -v patch >/dev/null 2>&1 || {
  echo >&2 "Installing patch";
  sudo yum install -y patch;
}
ftpsite="ftp://heasarc.nasa.gov/fermi/software/Summer_School_2017/"
bzfile=./xspec_patch.tar.bz2
if [ ! -f "/vagrant/$bzfile" ]; then
  cd /vagrant;
  wget $ftpsite/$bzfile;
fi
echo '--- .bashrc	2017-05-22 19:25:43.745198022 +0000
+++ bashrc	2017-06-01 22:16:07.683833436 +0000
@@ -9,10 +9,10 @@
 # export SYSTEMD_PAGER=

 # User specific aliases and functions
-export HEADAS=/usr/local/fermisoft/heasoft-6.21/x86_64-unknown-linux-gnu-libc2.17
-. $HEADAS/headas-init.sh
 export FERMI_DIR=/usr/local/fermisoft/v10r0p5-fssc-20150518A/x86_64-unknown-linux-gnu-libc2.17
 . $FERMI_DIR/fermi-init.sh
+export HEADAS=/usr/local/fermisoft/heasoft-6.21/x86_64-unknown-linux-gnu-libc2.17
+. $HEADAS/headas-init.sh
 export PRESTO=/usr/local/fermisoft/presto
 export TEMPO2=/usr/local/share/tempo2/
 export PGPLOT_DIR=/usr/local/pgplot' | patch -b "/home/vagrant/.bashrc";
tar jxvf /vagrant/$bzfile -C /usr/local/fermisoft/
hash -r
source $HEADAS/headas-init.sh
exit 0;
