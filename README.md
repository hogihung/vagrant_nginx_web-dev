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
vagrant@web-dev:~$ git --version
git version 1.7.9.5
vagrant@web-dev:~$ rvm -v
rvm 1.27.0 (latest) by Wayne E. Seguin <wayneeseguin@gmail.com>, Michal Papis <mpapis@gmail.com> [https://rvm.io/]
vagrant@web-dev:~$ ruby -v
ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-linux]
vagrant@web-dev:~$ rails -v
Rails 4.2.5
vagrant@web-dev:~$ psql --version
psql (PostgreSQL) 9.1.21
contains support for command-line editing
vagrant@web-dev:~$
```


