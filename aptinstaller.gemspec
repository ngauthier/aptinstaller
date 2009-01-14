# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{aptinstaller}
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Gauthier"]
  s.date = %q{2009-01-14}
  s.default_executable = %q{aptinstaller}
  s.description = %q{README.txt}
  s.email = %q{nick@smartlogicsolutions.com}
  s.executables = ["aptinstaller"]
  s.files = ["VERSION.yml", "TODO.markdown", "README.markdown", "bin/aptinstaller", "lib/aptinstaller.rb", "lib/aptinstaller", "lib/aptinstaller/aptinstaller.rb"]
  s.homepage = %q{http://github.com/ngauthier/aptinstaller}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
