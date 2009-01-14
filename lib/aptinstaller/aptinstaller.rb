require 'yaml'

class AptInstaller

  def self.autopkg(opts = {})
    config_yaml = self.read_yaml_file(opts[:config])
    packages = self.detect_packages_to_install(config_yaml['packages'])
    if packages[:not_installed].size > 0
      $stderr.write "\nThe following packages are required by this program but not installed:\n\n"
      packages[:not_installed].each do |package|
        $stderr.write "\t* "+package['name']+"\n"
      end
    end
    if packages[:out_of_date].size > 0

    end

    if packages[:not_installed].size + packages[:out_of_date].size > 0
      $stderr.write "\nYou can install and upgrade automatically by "
      $stderr.write "running \"aptinstaller\" in the root of your project\n\n"
      exit(1)
    end
  end

  def self.autopkg_install(rails_root = '.')
    rails_root ||= '.' # in case they pass in nil
    config_yaml = self.read_yaml_file(File.join(rails_root, 'config', 'aptinstaller.yml'))
    packages = self.detect_packages_to_install(config_yaml['packages'])
    if `which apt-get`.size == 0
      $stderr.write "I'm sorry, but we currently only support apt based package systems\n"
      $stderr.write "You will have to install the packages yourself\n"
      $stderr.flush
      exit(1)
    end
    if packages[:not_installed].size > 0
      pkg_str = packages[:not_installed].collect{|p| p['name']}.join(" ")
      system "apt-get install #{pkg_str}"
    end
    if packages[:out_of_date].size > 0
      
    end
    if packages[:not_installed].size + packages[:out_of_date].size == 0
      puts "All dependencies are installed"
    end
  end

  private

  def self.read_yaml_file(config_file)
    raise "Error reading config file, no :config parameter specified" unless config_file
    begin
      begin
        config = File.new(config_file, 'r').read
      rescue
        config = File.new(File.join(RAILS_ROOT, config_file), 'r').read
      end
    rescue => ex
      raise "Error reading config file at #{config_file}"
    end
    begin
      config_yaml = YAML::load(config)
    rescue => ex
      raise "Error parsing YAML file: #{ex.to_s}"
    end
    config_yaml
  end

  def self.detect_packages_to_install(packages)
    not_installed = []
    out_of_date = []
    packages.each do |package|
      not_installed.push(package) unless self.detect_package(package)
      out_of_date.push(package) unless self.verify_version(package)
    end
    {:not_installed => not_installed, :out_of_date => out_of_date}
  end

  def self.detect_package(package)
    info = `aptitude show #{package['name']}`.split("\n")
    meta = {}
    info.each{|i|
      i = i.split(": ")
      meta[i[0]] = i[1]
    }
    return meta['State'] == 'installed'
  end

  def self.verify_version(package)
    pkg_name = package['name']
    return true if package['version'] == nil
  end
end
