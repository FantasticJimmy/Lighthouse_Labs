class Admin::UsersController < ApplicationController
  before_filter :restrict_access
  before_filter :restrict_admin_access

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  protected
  def user_params
    params.require(:user).permit(
      :email,:firstname,:lastname,:admin)
  end


end