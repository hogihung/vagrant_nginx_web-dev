# Update Ubuntu
apt-get -y update

# Install the Nginx web server
apt-get -y install nginx

# Start nginx
service nginx start

# Install Vim
apt-get -y install vim

# Install git tool
apt-get -y install git

# Install curl utility
apt-get -y install curl

# Install RVM (Ruby Version Manager)
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2.3

source /usr/local/rvm/scripts/rvm

# Install Bundler
gem install bundler

# Install Rails 4.2.5
gem install rails -v 4.2.5

# Add postgresql 9.5 repo
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
sudo apt-get -y update

# Install postgresql 9.5
apt-get -y install postgresql postgresql-contrib

