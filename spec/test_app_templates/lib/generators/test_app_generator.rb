require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root "../../spec/test_app_templates"

  def add_gems
    gem 'blacklight', ">= 5.10"

    gem "jettywrapper"
    Bundler.with_clean_env do
      run "bundle install"
    end
  end

  def add_blacklight
    say_status("warning", "GENERATING BL", :yellow)

    generate 'blacklight:install', '--devise'
  end

  def add_blacklight_iiif
    generate 'blacklight:iiif:install'
  end
  
  def install_test_catalog_controller
    copy_file "catalog_controller.rb", "app/controllers/catalog_controller.rb", force: true
  end
end
