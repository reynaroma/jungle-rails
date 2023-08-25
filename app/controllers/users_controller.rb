class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # user_params is a method defined below
    if @user.save
      session[:user_id] = @user.id # auto-login after sign up
      redirect_to root_path, notice: 'User was successfully created!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
