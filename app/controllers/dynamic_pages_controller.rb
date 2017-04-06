class DynamicPagesController < ApplicationController
  def dashboard
    @user = current_user
  end

  def charts_data
    @user = current_user
  end

  def export_tables
    @user = current_user
  end

  def alerts
    @user = current_user
  end
end
