class Jobbr::InitializerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_config_file
    copy_file "jobbr.rb", "config/initializers/jobbr.rb"
  end

end
