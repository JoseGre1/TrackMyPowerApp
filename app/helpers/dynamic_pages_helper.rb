module DynamicPagesHelper
  #returns the dashboard being used by the current user
  def current_dashboard
    if !current_user.nil?
      @current_dashboard ||= current_user.dashboard
    end
  end
  def last_notifications
    current_user.notifications.where(created_at: (1.month.ago)..Time.now.tomorrow.midnight).order(created_at: :desc)
  end
end
