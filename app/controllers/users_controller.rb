class UsersController < ApplicationController
  def show
    @user = User.find_by(params[:id])
    return if @user
    flash[:danger] = t "static_pages.no_user"
    redirect_to signup_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t "static_pages.welcome_to"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
