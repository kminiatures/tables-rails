module TablesRails
  class Log
    include Mongoid::Document
    include Mongoid::Timestamps

    field :sql
  end
end
