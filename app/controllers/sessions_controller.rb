class SessionsController < ApplicationController
  layout "user_form"

  #Action for new session form (login)
  def new
    if logged_in?
      redirect_to current_user
    end
  end

  #create session
  def create
    #Find user hash by email or username
    if params[:session][:email].downcase.include? '@'
      user = User.find_by(email: params[:session][:email].downcase)
    else
      user = User.friendly.where('lower(username) = ?', params[:session][:email].downcase).first
    end
    #Compare if any user is found and if it can authenticate sucessfully
    if user && user.authenticate(params[:session][:password])
      #Using log_in method in SessionsHelper
      log_in user
      #Redirect to the URL accesed initially or to the default user profile URL
      redirect_back_or user
    else
      #Create error message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
