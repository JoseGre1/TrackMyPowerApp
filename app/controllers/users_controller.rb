class UsersController < ApplicationController
  #Before filters: correct user logged in
  before_action :logged_in_user, only: [:show, :edit, :update, :dashboard]
  before_action :correct_user,   only: [:show, :edit, :update, :dashboard]
  #User's profile web page
  def show
    @user = User.friendly.where('lower(username) = ?', params[:id].downcase).first
    redirect_to dashboard_url(@user)
  end

  #User signup web page
  def new
    if logged_in?
      redirect_to current_user
    else
      @user = User.new
      render layout:'user_form'
    end
  end

  #Create new user in DB
  def create
    @user = User.new(user_params)
    @user.dashboard = Dashboard.find_by(description: "Default")
    if @user.save
      # Tell the UserMailer to send a welcome email after save
      UserMailer.welcome_email(@user).deliver_later
      #logging user in using log_in method (from SessionsHelper)
      log_in @user
      #show message of sucessfull @user creation in @user page
      flash[:success] = "Welcome to the TrackMyPower App!"
      #redirect after sucessful save of new @user
      redirect_to @user
    else
      render :new, layout:'user_form'
    end
  end

  #Edit user in DB
  def edit
    @user = User.friendly.where('lower(username) = ?', params[:id].downcase).first
    @notifications = last_notifications
  end

  #Update user info in DB
  def update
    @user = User.friendly.where('lower(username) = ?', params[:id].downcase).first
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    #Extract user params from POST request in a safe way
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :username)
    end
  end
