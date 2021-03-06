class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def follow_user
    if current_user.follow @user.id
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow_user
    if current_user.unfollow @user.id
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
