class ProductsController < ApplicationController
  before_action :set_product, only: [:validate, :show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      search_result = Product.search_product(params[:query]).where(validation: true)

      user_diet_id = []

      current_user.user_restrictions.each do |restriction|
        user_diet_id << restriction.diet_id
      end

      filtered_products = []

      search_result.each do |product|
        product_diet_id = []
        product.product_restrictions.each do |restriction|
          product_diet_id << restriction.diet_id
        end
        filtered_products << product if (user_diet_id & product_diet_id).empty?
      end

      @products = filtered_products
    else
      @products = Product.where(validation: true).paginate(page: params[:page], per_page: 12)

    end
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
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
    @product.user = current_user
    if @product.save
      # params[:product][:product_restriction_ids].each do |diet_id|
      #   if Diet.exists?(diet_id)
      #     product_restriction = ProductRestriction.new(product: @product, diet: Diet.find(diet_id))
      #     @product.product_restrictions << product_restriction
      #   end
      # end
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

  def destroy
    @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    if current_user.admin?
      params.require(:product).permit(:name, :ingredients, :validation, :photo, :brand, :category, :diet_ids => [], :product_restriction_ids => [])
    else
      params.require(:product).permit(:name, :ingredients, :photo, :brand, :category, :diet_ids => [], :product_restriction_ids => [])
    end
  end
end
