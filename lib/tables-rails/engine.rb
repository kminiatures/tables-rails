require 'bootstrap-sass'
require 'codemirror-rails'
require 'devise'

module TablesRails
  class Engine < ::Rails::Engine
    isolate_namespace TablesRails
    config.tables_rails = ActiveSupport::OrderedOptions.new
  end
end
