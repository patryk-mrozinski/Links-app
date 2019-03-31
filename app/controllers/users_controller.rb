class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :set_user, only: %i[show edit update]

  def show
    users = User.all
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :image, :password)
  end
end
