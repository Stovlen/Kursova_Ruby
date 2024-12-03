module Admin
  class ReviewsController < ApplicationController
    before_action :require_admin

    def update
      @review = Review.find(params[:id])
      if @review.update(admin_response_params)
        redirect_back fallback_location: root_path, notice: "Відповідь додана успішно."
      else
        redirect_back fallback_location: root_path, alert: "Не вдалося додати відповідь."
      end
    end

    private

    def require_admin
      unless current_user&.role == "admin" || current_user&.admin?
        redirect_to root_path, alert: "У вас немає доступу до цієї дії."
      end
    end

    def admin_response_params
      params.require(:review).permit(:admin_response)
    end
  end
end
