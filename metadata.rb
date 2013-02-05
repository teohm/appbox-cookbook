name             "appbox"
maintainer       "Huiming Teo"
maintainer_email "teohuiming@gmail.com"
license          "MIT License"
description      "Installs/Configures appbox"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

supports "ubuntu"
supports "debian"

depends "apt"
depends "sudo"
depends "user"
depends "curl"
depends "htop"
depends "git"
