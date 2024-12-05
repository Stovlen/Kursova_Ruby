class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart = session[:cart] || {} # Отримуємо дані кошика із сесії
    @products = Product.where(id: @cart.keys) # Завантажуємо товари з бази за ID у кошику
    @total_price = calculate_total_price(@products, @cart) # Розраховуємо загальну суму
  end

  def create
    @cart = session[:cart] || {}
    @products = Product.where(id: @cart.keys)
    @total_price = calculate_total_price(@products, @cart)

    @order = Order.new(order_params)

    if @order.save
      session[:cart] = {} # Очищаємо кошик після створення замовлення
      session[:total_price] = @total_price # Зберігаємо загальну суму в сесії для оплати
      redirect_to new_payment_path, notice: 'Замовлення створено. Перейдіть до оплати.'
    else
      flash.now[:alert] = 'Помилка створення замовлення. Перевірте введені дані.'
      render :new
    end
  end

  private

  def calculate_total_price(products, cart)
    products.sum { |product| product.price * cart[product.id.to_s].to_i }
  end

  def order_params
    params.require(:order).permit(:name, :surname, :phone, :email, :delivery_method, :city, :branch_number)
  end
end
