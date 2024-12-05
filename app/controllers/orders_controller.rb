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

    @order = Order.new(order_params)

    if @order.save
      @cart.each do |product_id, quantity|
        product = Product.find(product_id)
        @order.order_items.create(product: product, quantity: quantity)
      end
      session[:cart] = {} # Очищаємо кошик після оформлення замовлення
      redirect_to new_payment_path, notice: 'Замовлення створено. Перейдіть до оплати.'
    else
      flash.now[:alert] = 'Помилка створення замовлення. Перевірте дані.'
      render :new
    end
  end


  private

  def calculate_total_price(products, cart)
    products.sum { |product| product.price * cart[product.id.to_s].to_i }
  end

  def order_params
    params.require(:order).permit(
      :name,
      :surname,
      :phone,
      :email,
      :delivery_method,
      :city,
      :branch_number,
      order_items_attributes: [:product_id, :quantity]
    )
  end

end
