# Aptinstaller: automatically install apt package dependencies

## Description
This gem installs packages through apt-get in a similar manner as geminstaller installs gems.

## Usage
    aptinstaller [path/to/rails/project/root]

## Configuration

### Add a Config File
Put something like this in config/aptinstaller.yml:

    ---
    packages:
      - name: firefox
      - name: gpac

### Add to Preinitializer

Then in config/preinitializer.rb (create it if it doesn't exist, it's pulled automatically
from boot.rb):

    require 'rubygems'
    require 'aptinstaller'
    AptInstaller.autopkg(:config => 'config/aptinstaller.yml')

## Installation

### Latest Stable
    sudo gem install ngauthier-aptinstaller

### Cutting Edge
    git clone git@github.com:ngauthier/aptinstaller.git aptinstaller
    cd aptinstaller
    rake gem
    sudo gem install pkg/aptinstaller

## Other Notes
This gem uses Jeweler. HighFive@technicalpickles!
