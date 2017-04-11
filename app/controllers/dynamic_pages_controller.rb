class DynamicPagesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  def dashboard
    @user = current_user
    @page = Page.find_by(title:"Dashboard",dashboard:current_dashboard)
  end

  def charts_data
    @user = current_user
    @page = Page.find_by(title:"Data Charts",dashboard:current_dashboard)
  end

  def export_tables
    @user = current_user
    @page = Page.find_by(title:"Tables",dashboard:current_dashboard)
  end

  def alerts
    @user = current_user
    @page = Page.find_by(title:"Alerts",dashboard:current_dashboard)
  end
end
