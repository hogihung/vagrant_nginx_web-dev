# Setup Notes

This repo was built to be used with Virtual Box and Vagrant.  Please make sure
you have installed both Virtual Box and Vagrant before trying to use.

  VirtualBox - https://www.virtualbox.org/wiki/Downloads

  Vagrant    - https://www.vagrantup.com/downloads.html

Once the above have been installed, follow these steps to get up and running:

```
# Change to your favorite location for working with projects
cd ~/Documents/PROJECTS/
git clone https://github.com/hogihung/vagrant_nginx_web-dev.git vagrant_nginx
cd vagrant_nginx
vagrant up
```  


Confirming the basics have all been installed properly:

```
vagrant ssh

vagrant@web-dev:~$ uname -a
Linux web-dev 3.2.0-23-generic #36-Ubuntu SMP Tue Apr 10 20:39:51 UTC 2012 x86_64 x86_64 x86_64 GNU/Linux
vagrant@web-dev:~$ vim --version
VIM - Vi IMproved 7.3 (2010 Aug 15, compiled May  4 2012 04:25:35)
{--snip--}
vagrant@web-dev:~$ git --version
git version 1.7.9.5
vagrant@web-dev:~$ ruby -v
ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-linux]
vagrant@web-dev:~$ rails -v
Rails 4.2.5
vagrant@web-dev:~$ sudo su postgres -
postgres@web-dev:/home/vagrant$ psql --version
psql (PostgreSQL) 9.5.2
postgres@web-dev:/home/vagrant$ exit
➜  vagrant_nginx git:(master) ✗
```

## Working between your host and virtual machine
Assumption:  You cloned this repo in a directory similar to:  /Users/your_user_name/PROJECTS/

If you are not already in the cloned repo directory, change to it now:

```
cd /Users/your_user_name/PROJECTS/vagrant_nginx

Example (my setup)
cd /Users/jfhogarty/Documents/RoR/vagrant_nginx
```

Create a file, for testing purposes, in the above directory.  Then edit the file with some basic text:

```
touch my_test_file.txt
vim my_test_file.txt

# This is a sample file
Hello from planet earth.
```

Save and exit the file.  Confirm the contents of the file:

```
cat my_test_file.txt

Example:
➜  vagrant_nginx git:(master) ✗ cat my_test_file.txt
# This is a sample file
Hello from planet earth.
➜  vagrant_nginx git:(master) ✗
```

In a different terminal session, navigate to the same directory as we did above:

```
cd /Users/your_user_name/PROJECTS/vagrant_nginx
```

Now we want to connect to our virtual machine.  If you don't have your VM up yet, do that first:

```
vagrant up   # only needed if the VM is not already running
vagrant ssh
```

Now that you are connected to your VM (virtual machine,) we can confirm that our my_test_fle.txt is synced to our VM.

```
cd /vagrant
ls -la

Example:
➜  vagrant_nginx git:(master) ✗ vagrant ssh
Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
New release '14.04.4 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Welcome to your Vagrant-built virtual machine.
Last login: Mon Apr 25 17:44:51 2016 from 10.0.2.2
vagrant@web-dev:~$

vagrant@web-dev:~$ cd /vagrant
vagrant@web-dev:/vagrant$ ls -la
total 28
drwxr-xr-x  1 vagrant vagrant  374 Apr 28 15:22 .
drwxr-xr-x 24 root    root    4096 Apr 25 15:36 ..
drwxr-xr-x  1 vagrant vagrant  408 Apr 28 15:25 .git
-rw-r--r--  1 vagrant vagrant   63 Apr 24 20:35 .gitignore
-rw-r--r--  1 vagrant vagrant   49 Apr 28 15:20 my_test_file.txt
-rw-r--r--  1 vagrant vagrant  943 Apr 25 17:18 provision.sh
-rw-r--r--  1 vagrant vagrant 2358 Apr 28 15:22 README.md
drwxr-xr-x  1 vagrant vagrant  102 Apr 24 20:40 .vagrant
-rw-r--r--  1 vagrant vagrant  383 Apr 25 17:44 Vagrantfile
vagrant@web-dev:/vagrant$

vagrant@web-dev:/vagrant$ cat my_test_file.txt
# This is a sample file
Hello from planet earth.
vagrant@web-dev:/vagrant$
```

As you can see, the file you created on your host, in the vagrant project directory, is syncronized to the VM.
You can update the file while on your VM, then go to your terminal session on the host machine and confirm that
the changes sync both ways.


