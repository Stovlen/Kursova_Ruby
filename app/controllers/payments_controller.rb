class PaymentsController < ApplicationController
  def new
    # Відображення форми оплати
  end

  def create
    # Простий сценарій: очищуємо кошик та перенаправляємо на сторінку успіху
    session[:cart] = {} # Очищення кошика
    redirect_to payment_success_path, notice: 'Оплата пройшла успішно!'
  end

  def success
    # Сторінка для підтвердження успішного замовлення
  end
end
