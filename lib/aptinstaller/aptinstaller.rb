require 'yaml'

class AptInstaller

  def self.autopkg(opts = {})
    config_yaml = self.read_yaml_file(opts[:config])
    packages = self.detect_packages_to_install(config_yaml['packages'])
    if packages.size > 0
      $stderr.write "\nThe following packages are required by this program but not installed:\n\n"
      packages.each do |package|
        $stderr.write "\t* "+package['executable']
        $stderr.write " (provided by package \"#{package['package']}\")" if package['package']
        $stderr.write "\n"
      end
      $stderr.write "\nYou can install them by running \"aptinstaller\" in the root of your project\n\n"
      exit(1)
    end
  end

  def self.autopkg_install(rails_root = '.')
    rails_root ||= '.' # in case they pass in nil
    config_yaml = self.read_yaml_file(File.join(rails_root, 'config', 'aptinstaller.yml'))
    packages = self.detect_packages_to_install(config_yaml['packages'])
    if `which apt-get`.size == 0
      $stderr.write "I'm sorry, but we currently only support apt based package systems\n"
      $stderr.flush
      exit(1)
    end
    if packages.size > 0
      exec("apt-get install #{packages.collect{|p| p['package'] || p['executable'] }.join(" ")}")
    else
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
    packages.each do |package|
      exec = package['executable']
      pkg = package['package']
      not_installed.push(package) if `which #{exec}`.size == 0
    end
    not_installed
  end
end
