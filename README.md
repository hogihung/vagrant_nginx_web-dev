VAGRANT BASED WEB-DEV ENVIRONMENT
================================

# What is included?
1.  Nginx Web Server (1.1.19)
2.  Vim
3.  Git
4.  Curl
5.  RVM (Ruby Version Manager)
6.  Ruby (2.2.3)
7.  Rails (4.2.5)
8.  Puma (3.4.0, Ruby concurrent web server)
9.  Node (0.6.12)
10. Postgresql 9.5
11. Sqlite 3 
12. Tmux 1.9


# Setup Notes

This repo was built to be used with Virtual Box and Vagrant.  Please make sure
you have installed both Virtual Box and Vagrant before trying to use.

  VirtualBox - https://www.virtualbox.org/wiki/Downloads

  Vagrant    - https://www.vagrantup.com/downloads.html

Once the above have been installed, follow these steps to get up and running:

```
# Change to your favorite location for working with projects
cd ~/Documents/PROJECTS/
git clone https://github.com/hogihung/vagrant_webdev_web-dev.git vagrant_webdev
cd vagrant_webdev
vagrant up
```  

*Note: The first time you run vagrant up, or if you do a vagrant destroy and
then a vagrant up, it will take some time as it is provisioning your environment.*


# Confirming the basics have all been installed properly:

```
vagrant ssh

vagrant@web-dev:~$ uname -a
Linux web-dev 3.2.0-23-generic #36-Ubuntu SMP Tue Apr 10 20:39:51 UTC 2012 x86_64 x86_64 x86_64 GNU/Linux
vagrant@web-dev:~$ 

vagrant@web-dev:~$ vim --version
VIM - Vi IMproved 7.3 (2010 Aug 15, compiled May  4 2012 04:25:35)
{--snip--}
vagrant@web-dev:~$

vagrant@web-dev:~$ git --version
git version 1.7.9.5
vagrant@web-dev:~$

vagrant@web-dev:~$ nginx -v
nginx version: nginx/1.1.19
vagrant@web-dev:~$

vagrant@web-dev:~$ puma --version
puma version 3.4.0
vagrant@web-dev:~$  

vagrant@web-dev:~$ ruby -v
ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-linux]
vagrant@web-dev:~$

vagrant@web-dev:~$ rails -v
Rails 4.2.5
vagrant@web-dev:~$

vagrant@web-dev:~$ node -v
v0.6.12
vagrant@web-dev:~$

vagrant@web-dev:~$ sudo su postgres -
postgres@web-dev:/home/vagrant$ psql --version
psql (PostgreSQL) 9.5.2
postgres@web-dev:/home/vagrant$ exit
➜  vagrant_webdev git:(master) ✗

vagrant@web-dev:~$ sqlite3 -version
3.7.9 2011-11-01 00:52:41 c7c6050ef060877ebe77b41d959e9df13f8c9b5e
vagrant@web-dev:~$ 

vagrant@web-dev:~$ tmux -V
tmux 1.6
vagrant@web-dev:~$
```

## Working between your host and virtual machine
Assumption:  You cloned this repo in a directory similar to:  /Users/your_user_name/PROJECTS/

If you are not already in the cloned repo directory, change to it now:

```
cd /Users/your_user_name/PROJECTS/vagrant_webdev

Example (my setup)
cd /Users/jfhogarty/Documents/RoR/vagrant_webdev
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
➜  vagrant_webdev git:(master) ✗ cat my_test_file.txt
# This is a sample file
Hello from planet earth.
➜  vagrant_webdev git:(master) ✗
```

In a different terminal session, navigate to the same directory as we did above:

```
cd /Users/your_user_name/PROJECTS/vagrant_webdev
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
➜  vagrant_webdev git:(master) ✗ vagrant ssh
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

# Starter Rails Application
While still logged in to your Vagrant VM (via vagrant ssh), create a directory
in your shared folder for your Rails projects:

```
vagrant@web-dev:~$ pwd
/home/vagrant
vagrant@web-dev:~$

vagrant@web-dev:~$mkdir RAILS_PROJECTS
vagrant@web-dev:~$cd RAILS_PROJECTS
```

Now that we have a directory for our Rails Projects, and we have changed to it,
let's create a sample Rails application:

```
rails new my_example_app
cd my_example_app
bundle
```

Next we need to start the rails server on the Vagrant VM:

```
rails s -b 0.0.0.0 Puma
```

Now, using a web browser on your Host operating system (Windows, OSX, Linux,)
visit the url:  http://localhost:3000

You should see the default Rails application welcome page:
**Welcome aboard**

Congratulations!
