# Vagrant Virtual Machine #
## Fermi Summer School 2017 ##

The Virtual Machine 'Box File' will be downloaded and prepared automatically by
the `preparevm.sh` script. The files are also available from
`ftp://heasarc.nasa.gov/fermi/software/Summer_School_2017`
if you need to download them seperately for whatever reason.

### Installation Instructions For Mac/Unix Systems ###

* Install/Upgrade VirtualBox, available from [here](https://www.virtualbox.org/wiki/Downloads)
* Install/Upgrade Vagrant, available from [here](https://www.vagrantup.com/downloads.html)
* If using Scientific Linux follow [this link](http://devopspy.com/devops/installing-vagrant-on-centos-7/)
* clone this repository: `git clone https://github.com/FermiSummerSchool/ssvm.git`
* `cd ssvm`
* `./preparevm.sh` Note, on a unix system this script will check for important software and download the necessary files, such as the vagrant box file.
* Now you can use it!
    * `vagrant ssh` will log you into the VM
    * In the VM the directory `/vagrant` is shared with wherever you're running the VM (in this example, the directory 'ssvm'.  You can put things there that you want to see in both the VM and your host machine.
        * Please note the difference between `/vagrant` and `/home/vagrant`. The former is the shared directory.
    * All programs should be setup and ready to go.  Give them a try.
    * If you want to log out, just type `exit`.
    * If you want to stop the VM, type `vagrant halt`
    * If you want to start the VM, type `vagrant up`
    * If you want to run jupyter run from within the VM:
        * `jupyter notebook --no-browser --ip=0.0.0.0 &`
        * and then open a browser on your host and point to the URL given in the terminal

### XSPEC patch instructions ###
This will apply a patch to the vagrant VM's version of XSPEC in the heasarc ftools.
It install the unix 'patch' utility on the VM, retrieve the 351MB binary 
tarball of the new tool, and update the VM environment.
* On your host machine in the 'ssvm' directory `git fetch && git pull`. This will update the git repository.
* Log into the VM with `vagrant ssh`.
* Execute the patch script with the command `/vagrant/xspec_patch_0.sh && . $HEADAS/headas-init.sh`.
    * It's possible you may need to log out and back in before your environment is properly set

### Tempo2/PGPLOT patch instructions ###
This will apply a patch to the vagrant VM's version of Tempo2 and PGPLOT to include additional plugins.
It will retrieve the 108MB binary tarball of the new tool, and apply it to the VM.
* On your host machine in the 'ssvm' directory `git fetch && git pull`. This will update the git repository.
* Log into the VM with `vagrant ssh`.
* Execute the patch script with the command `cd /vagrant && ./tempo2_patch_0.sh`.
* Run pgplot's X11 window server with `$PGPLOT_DIR/pgxwin_server &`.
