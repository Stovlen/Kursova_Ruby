class OrdersController < ApplicationController
  def new
    @order = Order.new
    @user_email = current_user&.email # Якщо користувач авторизований
    @cart = session[:cart] || {} # Отримуємо дані кошика із сесії
    @products = Product.where(id: @cart.keys) # Завантажуємо товари з бази за ID у кошику
    @total_price = calculate_total_price(@products, @cart) # Розраховуємо загальну суму
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      session[:cart] = {} # Очищаємо кошик після замовлення
      redirect_to root_path, notice: 'Замовлення успішно оформлено!'
    else
      flash.now[:alert] = 'Помилка оформлення замовлення. Перевірте введені дані.'
      render :new
    end
  end

  private

  # Метод для розрахунку загальної суми
  def calculate_total_price(products, cart)
    products.sum { |product| product.price * cart[product.id.to_s].to_i }
  end

  # Метод для отримання поточного користувача
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Параметри форми замовлення
  def order_params
    params.require(:order).permit(:name, :surname, :phone, :email, :street, :building, :apartment)
  end
end
