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


