class SessionsController < ApplicationController

  #Action for new session form (login)
  def new
  end

  #create session
  def create
    #Find user hash by email
    user = User.find_by(email: params[:session][:email].downcase)
    #Compare if any user is found and if it can authenticate sucessfully
    if user && user.authenticate(params[:session][:password])
      #Using log_in method in SessionsHelper
      log_in user
      #Redirect to user's show page
      redirect_to current_user
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
