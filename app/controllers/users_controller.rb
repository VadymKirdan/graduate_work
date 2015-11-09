class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def make_admin
    @user = User.where("id = ?", params[:user_id]).first
    @user.role_id = 2
    @user.save
    redirect_to :back
  end

  def back_to_user
    @user = User.where("id = ?", params[:user_id]).first
    @user.role_id = 3
    @user.save
    redirect_to :back
  end

end