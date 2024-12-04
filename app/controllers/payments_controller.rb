class PaymentsController < ApplicationController

  def create
    # Логіка обробки платежу
    if valid_payment?(payment_params)
      redirect_to root_path, notice: 'Оплата пройшла успішно!'
    else
      flash.now[:alert] = 'Помилка оплати. Перевірте введені дані.'
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:card_number, :expiry_date, :cvv, :send_receipt)
  end

  def valid_payment?(params)
    # Простий валідатор для прикладу
    params[:card_number].present? && params[:expiry_date].present? && params[:cvv].present?
  end
end
