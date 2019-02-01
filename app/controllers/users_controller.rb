class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save!

    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(params[:id])
    @user = User.update(user_params)
    @user = User.save!

    redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :bio, :room, :phone_number, :email)
  end
end
