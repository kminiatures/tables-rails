require_dependency "tables_rails/application_controller"

module TablesRails
  class TablesController < ApplicationController
    def index
      @tables = ActiveRecord::Base.connection.tables
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @tables }
      end
    end
  
    def show
      @table = {}
      @table_name = params['id']
      @table[:columns] = Module.const_get(@table_name).columns

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @table }
      end
    end

    def result
      @sql = params['sql']

      @records = ActiveRecord::Base.connection.select(@sql)

      render layout: false
    end
  end
end
