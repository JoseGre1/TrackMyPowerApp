class UsersController < ApplicationController

  #User's profile web page
  def show
    @user = User.friendly.find(params[:id])
  end

  #User signup web page
  def new
    @user = User.new
  end

  #Create new user in DB
  def create
    @user = User.new(user_params)
    if @user.save
      #logging user in using log_in method (from SessionsHelper)
      log_in @user
      #show message of sucessfull @user creation in @user page
      flash[:success] = "Welcome to the TrackMyPower App!"
      #redirect after sucessful save of new @user
      redirect_to @user
    else
      render 'new'
    end
  end

  #Edit user in DB
  def edit

  end

  #Sample code for posting info from arduino
  def post_it
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:confirm])
    @user.save
    render "User #{params[:name]} saved successfully!"
  end


  #Extract user params from POST request in a safe way
  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :username)
    end
  end
