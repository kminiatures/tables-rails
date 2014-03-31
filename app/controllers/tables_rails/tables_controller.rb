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
      @model_name = params['id']
      @table_name = @model_name.underscore.pluralize 
      @table[:columns] = Module.const_get(@model_name).columns

      begin
        count_sql = "select count(*) from #{@table_name}"
        @all_count = ActiveRecord::Base.connection.select(count_sql)[0]['count(*)']
      rescue 
        @all_count = "#{count_sql} で例外がおきました"
      end

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @table }
      end
    end

    def result
      @sql = params['sql']
      Log.new(sql: @sql).save

      @records = ActiveRecord::Base.connection.select(@sql)

      render layout: false
    end
  end
end
