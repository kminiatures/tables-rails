require 'bootstrap-sass'
require 'codemirror-rails'

module TablesRails
  class Engine < ::Rails::Engine
    isolate_namespace TablesRails
    config.tables_rails = ActiveSupport::OrderedOptions.new
  end
end
