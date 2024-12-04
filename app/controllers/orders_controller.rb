class OrdersController < ApplicationController
  def new
    @order = Order.new
    @user_email = current_user&.email # Якщо користувач авторизований
    @cart = session[:cart] || {} # Отримуємо дані кошика із сесії
    @products = Product.where(id: @cart.keys) # Завантажуємо товари з бази за ID у кошику
    @total_price = calculate_total_price(@products, @cart) # Розраховуємо загальну суму
    @branches = fetch_nova_poshta_branches
  end

  private

  def calculate_total_price(products, cart)
    products.sum { |product| product.price * cart[product.id.to_s].to_i }
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

  # Метод для отримання поточного користувача
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Метод для отримання відділень Нової Пошти через API
  def fetch_nova_poshta_branches
    api_key = 'e230aeb058a424ca3bd19ad0670ec7cd' # Вставте ваш реальний API-ключ
    url = 'https://api.novaposhta.ua/v2.0/json/'
    response = HTTP.post(url, json: {
      "apiKey": api_key,
      "modelName": "AddressGeneral",
      "calledMethod": "getWarehouses",
      "methodProperties": {}
    })

    data = JSON.parse(response.body.to_s)
    data['data'].map { |branch| branch['Description'] } # Повертаємо список відділень
  rescue StandardError => e
    Rails.logger.error("Помилка отримання відділень: #{e.message}")
    []
  end

  # Параметри форми замовлення
  def order_params
    params.require(:order).permit(:name, :surname, :phone, :email, :delivery_option, :branch, :street, :building, :apartment)
  end

end
