class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def edit
    @user = User.edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to index
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
