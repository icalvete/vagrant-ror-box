# vagrant-ror-box

Creating my own vagrant box 4 Ruby on Rails development environment.

# Overview

The purpose of this box is create a Ruby on Rails development enviroment based on the settings of de script **_installing_ruby_on_rails_ubuntu_trusty.sh_**

At the end, the box offers a full [rbenv](https://github.com/sstephenson/rbenv) + [Ruby on Rails](http://rubyonrails.org/)

# How to use

## Clone the repo

```bash
icalvete@dagon ~$ git clone https://github.com/icalvete/vagrant-ror-box.git
icalvete@dagon ~$ cd vagrant-ror-box
icalvete@dagon ~/vagrant-ror-box$
```

## Edit installing_ruby_on_rails_ubuntu_trusty.sh

Edit this script to customize your ruby instalation.

At this time settings are the [last version on heroku].(https://devcenter.heroku.com/articles/ruby-support)

## Run the box

Run the box and wait for a while. Ruby need to compiled.

```bash
icalvete@dagon ~/vagrant-ror-box$ vagrant up
```

## Prepare the box to be used

```bash
icalvete@dagon ~/vagrant-ror-box$ vagrant package --output ror.box
```

## Use the box

### Creating a new box

You can add the box right now to your vagrant 

### Loading the box

#### Loading the box to your vagrant

```bash
icalvete@dagon ~/vagrant-ror-box$ vagrant box add ror ror.box
```

#### Loading the box to vagrantcloud

But maybe you prefer share your box with other people.

In this case, use [vagrantcloud.com](http://vagrantcloud.com) to upload there you new box.

1. Create and account
2. Use the top menu to got to vagrant section
![alt tag](https://raw.github.com/icalvete/vagrant-ror-box/doc/topmenu.jpg)
3. Use the buton **Create a Vagrant Box with the Web UI**
![alt tag](https://raw.github.com/icalvete/vagrant-ror-box/doc/createbox.jpg)
4. Follow the instructions
  1. Create a version.
  2. Create a provider.
  3. Upload a box.
  4. Release the version.

### Use the box

Now you can use this box in your **Vagrantfile**.

For example you can use my own version...

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
# All Vagrant configuration is done here. The most common configuration
# options are documented and commented below. For a complete reference,
# please see the online documentation at vagrantup.com.

# Every Vagrant virtual environment requires a box to build off of.
config.vm.box = "icalvete/ror-dev"
config.vm.hostname = "ror"
```

## Authors:

Israel Calvete Talavera <icalvete@gmail.com>
