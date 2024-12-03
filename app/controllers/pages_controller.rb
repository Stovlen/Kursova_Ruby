class PagesController < ApplicationController
  before_action :require_user

  def welcome
    @user = current_user
  end

  private

  def require_user
    redirect_to new_user_path unless session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def about
  end

  def contact
  end

  def privacy
  end

end
