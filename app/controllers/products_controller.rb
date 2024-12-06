class ProductsController < ApplicationController
  def index
    @products = Product.all

    # Пошук по назві товару
    if params[:query].present?
      @products = @products.where("name ILIKE ?", "%#{params[:query]}%")
    end

    # Фільтр за наявністю цукру
    if params[:sugar_content].present?
      @products = @products.where(sugar_content: params[:sugar_content])
    end

    # Фільтр за країною виробником
    if params[:country].present?
      @products = @products.where(country: params[:country])
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
