name             "appbox"
maintainer       "Huiming Teo"
maintainer_email "teohuiming@gmail.com"
license          "Apache License 2.0"
description      "Provides a set of recipes to setup a base app server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.1"

supports "ubuntu"
supports "debian"

depends "apt"
depends "sudo"
depends "user"
depends "curl"
depends "htop"
depends "git"
depends "tmux"
