Gem::Specification.new do |s|
  s.name     = "aptinstaller"
  s.version  = "0.1.0"
  s.date     = "2009-01-13"
  s.summary  = "Automatic package install for rails projects in ubuntu."
  s.email    = "nick@smartlogicsolutions.com"
  s.homepage = "http://github.com/ngauthier/aptinstaller"
  s.description = "Aptinstaller automatically installs packages from the ubuntu repositories when they are listed as dependencies in your rails project."
  s.has_rdoc = true
  s.authors  = ["Nick Gauthier"]
  s.files    = [
    "History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/aptinstaller",
    "aptinstaller.gemspec", "lib/aptinstaller.rb", "lib/aptinstaller/version.rb"
  ] 
  s.executables = ["aptinstaller"]
  s.rdoc_options = ["--main", "README.txt"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end
