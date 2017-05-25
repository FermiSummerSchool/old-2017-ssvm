# Vagrant Virtual Machine #
## Fermi Summer School 2017 ##

### Installation Instructions ###
* clone this repository: `git clone https://github.com/FermiSummerSchool/ssvm.git`
* Install/Upgrade VirtualBox, available from https://www.virtualbox.org/wiki/Downloads
* Install/Upgrade Vagrant, available from https://www.vagrantup.com/downloads.html
* `./preparevm.sh`
* Now you can use it
    * `vagrant ssh` will log you into the VM
    * In the VM the directory '/vagrant' is shared with wherever you're running the VM (in this example, the directory 'ssvm'.  You can put things there that you want to see in both the VM and your host machine.
    * All programs should be setup and ready to go.  Give them a try.
    * If you want to log out, just type `exit`.
    * If you want to stop the VM, type `vagrant halt`
    * If you want to start the VM, type `vagrant up`
    * If you want to run jupyter run from within the VM:
        * `jupyter notebook --no-browser --ip=0.0.0.0 &`
        * and then open a browser on your host and point to the URL given in the terminal
