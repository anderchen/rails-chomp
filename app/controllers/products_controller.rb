class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  def index
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :photo, :validation, :brand, :category)
  end
end
