class Admin::ProductsController < ApplicationController
  # before_action :set_filter, only: [:index]

  def index
    # @products = @filter.scope
    @products = Product.all
    respond_to do |format|
      format.html
      format.csv do
        filename = ['Products', Time.now].join(' ')
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=#{filename}.csv"
        render template: 'admin/products/index'
      end
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :low_stock_level, :description, :image)
  end

  def set_filter
    @filter = ::ProductFilter.new
    @filter.update(filter_params)
  end

  def filter_params
    params.permit(:product_name)
  end
end
