class LowStockMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def low_stock_notification(sale)
    @product = sale.product
    mail(
      to: 'recipient@example.com', # Replace with recipient's email
      subject: "#{@product.name} Stock Level."
    )
  end
end
