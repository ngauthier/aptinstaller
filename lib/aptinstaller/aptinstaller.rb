require 'yaml'

class AptInstaller

  def self.autopkg(opts = {})
    config_file = opts.delete(:config)
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
    errors = []
    config_yaml['packages'].each do |package|
      exec = package['executable']
      pkg = package['package']
      errors.push(package) if `which #{exec}`.size == 0
    end
    if errors.size > 0
      $stderr.write "\nThe following packages are required by this program but not installed:\n\n"
      errors.each do |package|
        $stderr.write "\t* "+package['executable']+"\n"
      end
      $stderr.write "\nYou can install them by running:\n"
      $stderr.write "\tapt-get install "
      $stderr.write errors.collect{|p| p['package'] || p['executable']}.join(" ")
      $stderr.write "\n\nor by running \"aptinstaller\" in the root of your project\n\n"
      exit(1)
    end
end
