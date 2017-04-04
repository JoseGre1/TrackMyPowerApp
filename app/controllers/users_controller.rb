class UsersController < ApplicationController
  #Before filters: correct user logged in
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:show, :edit, :update]
  #User's profile web page
  def show
    @user = User.friendly.where('lower(username) = ?', params[:id].downcase).first
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

  #Sample code for posting info from arduino
  def post_it
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:confirm])
    @user.save
    render "User #{params[:name]} saved successfully!"
  end


  private
    #Extract user params from POST request in a safe way
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :username)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct logged-in user.
    def correct_user
      @user = User.friendly.where('lower(username) = ?', params[:id].downcase).first
      redirect_to(root_url) unless current_user?(@user)
    end
  end
