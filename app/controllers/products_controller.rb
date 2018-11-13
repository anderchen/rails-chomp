class ProductsController < ApplicationController
  before_action :set_product, only: [:validate, :show, :edit, :update]
  def index
    @products = Product.all
  end

  def show
  end

  def validate
    @product.validation = true if current_user.admin?
    @product.save
    redirect_back(fallback_location: root_path)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_users
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    if current_user.admin?
      params.require(:product).permit(:name, :description, :validation, :photo, :brand, :category)
    else
      params.require(:product).permit(:name, :description, :photo, :brand, :category)
    end
  end
end
