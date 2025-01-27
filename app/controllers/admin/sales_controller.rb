class Admin::SalesController < ApplicationController

  def new
    @sale = Sale.new

    @products = Product.all.map { |p| [p.name, p.id, { data: { price: p.price } }] }
  end

  def create
    @sale = Sale.new(sale_params)
    respond_to do |format|
      if @sale.save

        # if sale.product.quantity <= @sale.product.stock_level
          # Notification.create!(
          #   action: "#{@sale.product.name} is Out Of Stock !",
          #   product: @sale.product
          # )
        # end

        format.html { redirect_to  admin_sales_path, notice: "Sale made successfully !" }
      else
        @sale_errors = @sale.errors
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("error_explanation",
              partial: "shared/errors",
              locals: { errors: [] << @sale.errors }
            ),
            turbo_stream.update(@sale,
              partial: "form",
              locals: { sale: @sale }
            )
          ]
        end
      end
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
