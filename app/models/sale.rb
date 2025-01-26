# == Schema Information
#
# Table name: sales
#
#  id          :integer          not null, primary key
#  quantity    :integer
#  total_price :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer          not null
#
# Indexes
#
#  index_sales_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
class Sale < ApplicationRecord
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_validation :calculate_total_price

  def date
    created_at.strftime("%a %d-%m-%Y")
  end

  def product_name
    Product.find(product_id).name
  end

  private

  def calculate_total_price
    return unless product && quantity

    self.total_price = product.price.to_f * quantity
  end
end
