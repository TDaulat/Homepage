class Admin::DashboardController < ApplicationController
  before_filter :admin_login_required
  
  def index

  end
end