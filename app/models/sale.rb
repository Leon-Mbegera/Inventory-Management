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
  validate :quantity_greater_than_product_quantity_in_stock

  before_create :calculate_total_price
  after_create :reduce_product_quantity

  def date
    created_at.strftime("%a %d-%m-%Y at %I:%M%p")
  end

  def product_name
    product.name
  end

  private

  def calculate_total_price
    return unless product && quantity

    total_price = product.price.to_f * quantity
  end

  def reduce_product_quantity
    product.quantity -= quantity
    product.save
  end

  def quantity_greater_than_product_quantity_in_stock
    if quantity > product.quantity
      errors.add(:quantity, "Sale quantity: #{quantity} exceeds product quantity in stock: #{product.quantity} !")
    end
  end
end
