class PaymentsController < ApplicationController
  def new
    # Відображення форми оплати
  end

  def create
    # Простий сценарій: перенаправляємо на сторінку успіху
    redirect_to payment_success_path, notice: 'Оплата пройшла успішно!'
  end

  def success
    # Сторінка для підтвердження успішного замовлення
  end
end
