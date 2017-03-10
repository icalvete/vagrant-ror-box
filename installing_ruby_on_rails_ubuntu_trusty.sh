#!/bin/bash

# For https://www.coursera.org/learn/ruby-on-rails-intro/home/welcome
#
# Based on https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04

sudo apt-get update -y

sudo apt-get --ignore-missing install \
build-essential \
git \
git-core \
curl \
openssl \
libssl-dev \
libcurl4-openssl-dev \
zlib1g \
zlib1g-dev \
libreadline-dev \
libreadline6 \
libreadline6-dev \
libyaml-dev \
libsqlite3-dev \
libsqlite3-0 \
sqlite3 \
libxml2-dev \
libxslt1-dev \
python-software-properties \
libffi-dev \
libgdm-dev \
libncurses5-dev \
automake \
autoconf \
libtool \
bison \
libpq-dev \
libmysqlclient-dev \
libc6-dev \
bzip2 \
vim \
software-properties-common \
python-software-properties \
-y

sudo add-apt-repository ppa:chris-lea/node.js -y
sudo apt-get update -y
sudo apt-get --ignore-missing install nodejs -y

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/ianheggie/rbenv-binstubs.git ~/.rbenv/plugins/rbenv-binstubs
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

echo "gem: --no-document" > ~/.gemrc

. ~/.bashrc

${HOME}/.rbenv/bin/rbenv install -v 2.2.5
${HOME}/.rbenv/bin/rbenv install -v 2.3.1
${HOME}/.rbenv/bin/rbenv global 2.3.1

mkdir ~/.bundle/
cat > ~/.bundle/config << EOL
---
BUNDLE_PATH: ~/vendor/bundle
BUNDLE_DISABLE_SHARED_GEMS: "1"
EOL

 . ~/.bundle/config

${HOME}/.rbenv/shims/gem install bundler

# 4.2.3 version for Coursera course
${HOME}/.rbenv/shims/gem install rails -v 4.2.3

export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
cd /tmp
curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar xvjf -
sudo mv $PHANTOM_JS /usr/local/share
sudo ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
