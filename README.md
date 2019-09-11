# vagrant-ror-box

Creating my own vagrant box 4 Ruby on Rails development environment.

# Overview

The purpose of this box is create a Ruby on Rails development enviroment based on the settings of de script **_installing_ruby_on_rails_ubuntu_trusty.sh_**

**Read the script carefully and feel free to customize whatever you want.**

At the end, the box offers...

* [rbenv](https://github.com/sstephenson/rbenv)
* [ruby-build](https://github.com/sstephenson/ruby-build)
* [rbenv-binstubs](https://github.com/ianheggie/rbenv-binstubs)
* [rbenv-gem-rehash](https://github.com/sstephenson/rbenv-gem-rehash)
* [rbenv-update](https://github.com/rkh/rbenv-update)

Ready to easy develop any [Ruby](http://ruby-doc.org/) or [Ruby on Rails](http://rubyonrails.org/) app.

# How to use

## Clone the repo

```bash
icalvete@dagon ~$ git clone https://github.com/icalvete/vagrant-ror-box.git
icalvete@dagon ~$ cd vagrant-ror-box
icalvete@dagon ~/vagrant-ror-box$
```

## Edit installing_ruby_on_rails_ubuntu_trusty.sh

Edit this script to customize your ruby instalation.

At this time settings are the [lasts version on heroku].(https://devcenter.heroku.com/articles/ruby-support)

* Ruby 2.2.8
* Ruby 2.3.5
* Ruby 2.4.7
* Ruby 2.5.6
* Ruby 2.6.4 (Default as global)
* Ruby 2.7.0-dev
* Rails 5.2.3

## Run the box

Run the box and wait for a while. Ruby need to compiled.

```bash
icalvete@dagon ~/vagrant-ror-box$ vagrant up
```

## Custom the box

You could customize whatever you want before export the box

For example, to see a version from [ruby-build built-in definitions](https://github.com/rbenv/ruby-build/tree/master/share/ruby-build)

```bash
 $ ruby-build --definitions
```

To add some version to the box.

```bash
 $ rbenv install -v 1.9.3-p551
```

## Prepare the box to be used

```bash
icalvete@dagon ~/vagrant-ror-box$ vagrant package --output ror.box
```

## Use the box

### Creating a new box

You can add the box right now to your vagrant

### Loading the box

#### Loading the box to your vagrant (Not recomended)

```bash
icalvete@dagon ~/vagrant-ror-box$ vagrant box add ror ror.box
```

#### Loading the box to vagrantcloud (Recomended)

But maybe you prefer share your box with other people.

In this case, use [vagrantcloud.com](http://vagrantcloud.com) to upload there you new box.

1. Create and account
2. Use the top menu to got to vagrant section
![alt tag](https://raw.githubusercontent.com/icalvete/vagrant-ror-box/master/doc/topmenu.jpg)
3. Use the buton **Create a Vagrant Box with the Web UI**
![alt tag](https://raw.githubusercontent.com/icalvete/vagrant-ror-box/master/doc/createbox.jpg)
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
config.vm.box = "icalvete/ror"
config.vm.box_version = "<= 0.0.9"
config.vm.hostname = "ror"
```

## Box version

There are some [versions](https://app.vagrantup.com/icalvete/boxes/ror) of this box.

## Way of working

Then for each application directory run the following just once:

```bash
$ rails new myapp --skip-bundle
$ bundle install --path vendor/bundle --binstubs .bundle/bin
```

Since you have **_BUNDLE_PATH: ~/vendor/bundle_** inside your **_~/.bundle/config_** all gem instaled using gem will be instaled in **_~/vendor/bundle_** but ...

Since you have **_BUNDLE_DISABLE_SHARED_GEMS: "1"_** inside your **_~/.bundle/config_** every app is a full isolated gem environment after you run...

```bash
$ rails new myapp --skip-bundle
$ bundle install --path vendor/bundle --binstubs .bundle/bin
```

## Authors:

Israel Calvete Talavera <icalvete@gmail.com>
