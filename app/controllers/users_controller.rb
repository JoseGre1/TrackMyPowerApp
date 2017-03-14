class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

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

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

  #SAMPLE CODE FOR POSTING INFO FROM ARDUINO
  def post_it
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:confirm])
    @user.save
    render "User #{params[:name]} saved successfully!"
  end
end
