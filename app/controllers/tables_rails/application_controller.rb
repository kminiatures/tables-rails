module TablesRails
  class ApplicationController < ActionController::Base
    before_filter :authenticate_manage_user!
  end
end
