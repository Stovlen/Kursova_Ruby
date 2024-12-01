class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(review_params)

    if @review.save
      redirect_to product_path(@product), notice: 'Відгук успішно додано!'
    else
      redirect_to product_path(@product), alert: 'Не вдалося додати відгук. Перевірте введені дані.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :comment)
  end
end
