module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  #returns the user being used in the current session
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #Checks if current_user is logged_in
  def logged_in?
    !current_user.nil?
  end

  #Log out current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
