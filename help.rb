require 'yaml'

class Help

  $help_file = YAML::load(File.open('help.yml'))

  def get *args
    help_file.values

  end

  def help_file
    $help_file
  end
  
end
