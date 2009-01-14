# Aptinstaller: automatically install apt package dependencies

## Description
This gem installs packages through apt-get in a similar manner as geminstaller installs gems.

## Usage
aptinstaller [/full/path/to/rails/project/root]

## Configuration

### Add a Config File
Put something like this in config/aptinstaller.yml:

---
packages:
  - executable: firefox
  - executable: MP4Box
    package: gpac

The executable field is the name of the executable (i.e. $ MP4Box). If the package's name in the
repositories is different from the executable, specify the package name with the "package"
field (i.e. "gpac" which provides the MP4Box executable).

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
rake gem
sudo gem install pkg/aptinstaller-x.y.z.gem

