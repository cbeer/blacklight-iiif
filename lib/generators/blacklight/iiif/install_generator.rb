require 'rails/generators'

module Blacklight
  module Iiif
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def riiif
        gem 'riiif'
        copy_file "riif_initializer.rb", "config/initializers/riiif_initializer.rb"
      end
    end
  end
end