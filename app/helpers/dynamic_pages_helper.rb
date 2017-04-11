module DynamicPagesHelper
  #returns the dashboard being used by the current user
  def current_dashboard
    if !current_user.nil?
      @current_dashboard ||= current_user.dashboard
    end
  end
end
