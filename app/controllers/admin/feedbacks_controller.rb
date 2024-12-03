module Admin
  class FeedbacksController < ApplicationController
    before_action :require_admin

    def index
      @feedbacks = Feedback.all.order(created_at: :desc)
    end

    private

    def require_admin
      unless current_user&.role == "admin" || current_user&.admin?
        redirect_to root_path, alert: "У вас немає доступу до цієї сторінки."
      end
    end
  end
end
