class UsersController < ApplicationController
  
 protected

  def set_user
    @user = User.find(params[:id])
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :sign_in_count, :role_id)
  end

end