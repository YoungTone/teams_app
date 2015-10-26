class SessionsController < ApplicationController
  def signup
    #create blank user needed to populate form for
    @user = User.new
  end

  # should only render login page
  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        # found in db and pw correct
        authorized_user = found_user.authenticate(params[:password])
        if authorized_user
          session[:user_id] = authorized_user.id
          flash[:success] = "Login Successful"
          redirect_to home_path
        else
          flash[:alert] = "Error: Incorrect Username/Password"
          redirect_to login_path
        end
      end
    end
  end


  def home
  end

  def create
    #give the blank user from signup some data from the form
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "New User Created"
      redirect_to root_path
    else
      render :home
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Logged Out"
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :password_confirmation
    )
  end
end
