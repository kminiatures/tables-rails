require_dependency "tables_rails/application_controller"

module TablesRails
  class LogsController < ApplicationController
    def index
      @logs = Log.order_by(:created_at.desc).limit(30)
      render layout: false
    end
  
    def show
    end
  end
end
