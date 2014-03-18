require 'bootstrap-sass'

module TablesRails
  class Engine < ::Rails::Engine
    isolate_namespace TablesRails
    config.tables_rails = ActiveSupport::OrderedOptions.new
  end
end
