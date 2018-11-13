class ReviewsController < ApplicationController
  def show
  end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)

    @review.product = @product

    if @review.save
      respond_to do |format|
        format.html { redirect_to product_path(@product) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'product/show' }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :product_id, :score, :content)
  end
end
