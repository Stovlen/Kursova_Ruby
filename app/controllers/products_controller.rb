class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = @products.where("name ILIKE ? OR category ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%") if params[:query].present?
    @products = @products.where(category: params[:category]) if params[:category].present?
  end


  def show
    @product = Product.find(params[:id]) # Завантажуємо конкретний продукт
  end

end
