class Admin::UsersController < ApplicationController
  before_action :require_admin

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = "admin" # Примусово встановлюємо роль адміністратора
    if @user.save
      redirect_to admin_dashboard_path, notice: "Адміністратор створений успішно."
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
