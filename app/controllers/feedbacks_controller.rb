class FeedbacksController < ApplicationController
  before_action :require_user

  def new
    # Відображення форми
  end

  def create
    # Логіка обробки форми
    feedback_params = params.require(:feedback).permit(:subject, :message)

    # Наприклад, збереження у базу даних (за потреби)
    Feedback.create(
      user_id: session[:user_id],
      subject: feedback_params[:subject],
      message: feedback_params[:message]
    )

    # Показуємо повідомлення та перекидаємо на головну
    redirect_to root_path, notice: 'Ваше повідомлення надіслано успішно!'
  end

  private

  def require_user
    unless session[:user_id]
      redirect_to new_session_path, alert: 'Будь ласка, увійдіть, щоб залишити повідомлення.'
    end
  end
end
