class SessionsController < ApplicationController
  def new
    # Форма входу
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to welcome_path, notice: 'Ви увійшли успішно!'
    else
      flash.now[:alert] = 'Невірний email або пароль'
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    session[:user_id] = nil
    session[:cart] = {} # Очищення кошика
    redirect_to root_path, notice: 'Ви вийшли з профілю.'
  end
end
