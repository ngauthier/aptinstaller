# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/aptinstaller.rb'
require "./lib/aptinstaller/version"

PKG_NAME      = "aptinstaller"
PKG_BUILD     = ENV['PKG_BUILD'] ? '.' + ENV['PKG_BUILD'] : ''
version = Aptinstaller::Version::STRING.dup
if ENV['SNAPSHOT'].to_i == 1
  version << "." << Time.now.utc.strftime("%Y%m%d%H%M%S")
end
PKG_VERSION   = version
PKG_FILE_NAME = "#{PKG_NAME}-#{PKG_VERSION}"

Hoe.new(PKG_NAME, PKG_VERSION) do |p|
  p.rubyforge_name = 'nickgauthier' # if different than lowercase project name
  p.developer('Nick Gauthier', 'nick@smartlogicsolutions.com')
  p.name = PKG_NAME
  p.version = PKG_VERSION
  p.author = "Nick Gauthier"
  p.email = "nick@smartlogicsolutions.com"
  p.description = %q(This ruby executable (aptinstaller) will install all packages listed in the configuration file using the native OS's apt-get command. )
  p.summary = p.description # More details later??
  p.remote_rdoc_dir = PKG_NAME # Release to /PKG_NAME
  #  p.changes = p.paragraphs_of('CHANGELOG', 0..1).join("\n\n")
  p.need_zip = true
  p.need_tar = false
end
