module Admin
  class OrdersController < ApplicationController
    before_action :require_admin

    def index
      @orders = Order.all.order(created_at: :desc) # Виводимо всі замовлення, відсортовані за датою створення
    end

    def show
      @order = Order.find(params[:id]) # Знаходимо конкретне замовлення
    end

    private

    def require_admin
      unless current_user&.admin?
        redirect_to root_path, alert: 'У вас немає доступу до цієї сторінки.'
      end
    end
  end
end
