class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    # Тут може бути код для відображення статистики або управління
    @users = User.all
  end

  private

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "У вас немає доступу до цієї сторінки."
    end
  end
end
