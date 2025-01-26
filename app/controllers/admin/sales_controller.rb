class Admin::SalesController < ApplicationController
  def new
    @sale = Sale.new
    @products = Product.all.map { |p| [p.name, p.id, { data: { price: p.price } }] }
  end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to admin_sales_path
    else
      @products = Product.all
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @sales = Sale.all
  end

  private

  def sale_params
    params.require(:sale).permit(:product_id, :quantity)
  end
end
