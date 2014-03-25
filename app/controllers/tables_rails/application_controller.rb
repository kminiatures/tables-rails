module TablesRails
  class ApplicationController < ActionController::Base
    before_filter :set_option

    def set_option
      send TablesRails.authenticate_method if TablesRails.authenticate_method
    end
  end
end
