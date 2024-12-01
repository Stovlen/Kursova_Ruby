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
end
