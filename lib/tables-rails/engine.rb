require 'bootstrap-sass'
require 'codemirror-rails'
require 'devise'
require 'mongoid'


module TablesRails
  class Engine < ::Rails::Engine
    isolate_namespace TablesRails
  end
end
Mongoid.load! TablesRails::Engine.root.join("config", 'mongoid.yml')
