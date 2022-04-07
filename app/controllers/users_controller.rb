class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    reset_session
    redirect_to :index
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
