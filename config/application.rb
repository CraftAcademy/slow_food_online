require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module SlowFoodOnline
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')

    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
    end
  end

end
