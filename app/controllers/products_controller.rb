class ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:query].present?
      @products = @products.where("name ILIKE ? OR category ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    if params[:category].present?
      @products = @products.where(category: params[:category])
    end
  end


  def show
    @product = Product.find(params[:id]) # Завантажуємо конкретний продукт
  end

  def search
    query = params[:query]
    if query.present?
      @products = Product.where("name ILIKE ? OR category ILIKE ?", "%#{query}%", "%#{query}%")
      @search_message = "По запиту «#{query}» знайшлося #{@products.count} товарів"
    else
      @products = Product.all
      @search_message = "Введіть запит для пошуку товарів"
    end

    render :index
  end

end
