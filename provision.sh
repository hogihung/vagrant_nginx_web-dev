apt-get -y update

apt-get -y install nginx

service nginx start

apt-get -y install git

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

apt-get -y install curl

\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2.3

gem install bundler

gem install rails -v 4.2.5

sudo apt-get -y install postgresql postgresql-contrib
