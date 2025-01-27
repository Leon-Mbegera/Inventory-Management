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
require "test_helper"

class SaleTest < ActiveSupport::TestCase
  def setup
    @sale_one = sales(:sale_one)
    @sale_two = sales(:sale_two)
    @product_one = products(:product_one)
  end

  test "valid sale" do
    assert @sale_one.valid?
  end

  test "quantity must be greater than 0" do
    @sale_one.quantity = 0
    assert_not @sale_one.valid?, "Sale is valid with a quantity of 0"
  end

  test "quantity greater than product stock is invalid" do
    @sale_one.quantity = @product_one.quantity + 1
    assert_not @sale_one.valid?, "Sale is valid with a quantity exceeding product stock"
  end

  test "product quantity is reduced after sale creation" do
    initial_quantity = @product_one.quantity
    new_sale = Sale.create!(product: @product_one, quantity: 5)
    assert_equal initial_quantity - 5, @product_one.reload.quantity
  end

  test "date formats correctly" do
    assert_equal @sale_one.created_at.strftime("%a %d-%m-%Y at %I:%M%p"), @sale_one.date
  end
end

