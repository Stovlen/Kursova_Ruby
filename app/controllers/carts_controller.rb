class CartsController < ApplicationController
  def show
    @cart = session[:cart] || {}
    @products = Product.where(id: @cart.keys)
  end

  def add
    session[:cart] ||= {}
    product_id = params[:product_id]

    if session[:cart][product_id]
      session[:cart][product_id] += 1
    else
      session[:cart][product_id] = 1
    end

    redirect_to cart_path, notice: 'Товар додано до кошика!'
  end

  def remove
    product_id = params[:product_id]
    session[:cart]&.delete(product_id)

    redirect_to cart_path, notice: 'Товар видалено з кошика!'
  end

  def clear
    session[:cart] = {}
    redirect_to cart_path, notice: 'Кошик успішно очищено!'
  end

  def update_quantity
    product_id = params[:product_id]
    quantity = params[:quantity].to_i

    if quantity.between?(1, 10)
      session[:cart][product_id] = quantity
      @product = Product.find(product_id)
      total_price = calculate_total_price

      render json: {
        item_price: helpers.number_to_currency(@product.price * session[:cart][product_id], unit: "₴"),
        total_price: helpers.number_to_currency(total_price, unit: "₴")
      }
    else
      head :unprocessable_entity
    end
  end

  private

  def calculate_total_price
    session[:cart].sum do |product_id, quantity|
      product = Product.find(product_id)
      product.price * quantity
    end
  end

end
