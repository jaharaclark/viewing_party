class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    binding.pry
    user = user_params
    user_email = user[:email].downcase
    new_user = User.create(user_params)
    if new_user.save
      session[:user_id] = new_user.id #session comes with rails
      flash[:info] = "Welcome, #{new_user.email}!"
      redirect_to dashboard_path(user_email: "#{new_user.email}")
    elsif !new_user.save
      flash[:error] = "Please make sure the passwords match"
      redirect_to register_path
      # render :new
    end #make sad path error as well
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
