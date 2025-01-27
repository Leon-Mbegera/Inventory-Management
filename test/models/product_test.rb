# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  description     :string
#  low_stock_level :integer          default(0), not null
#  name            :string
#  price           :string
#  quantity        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  def setup
    @product_one = products(:product_one)
    @product_two = products(:product_two)
  end

  test "valid product" do
    assert @product_one.valid?
  end

  test "invalid without name" do
    @product_one.name = nil
    assert_not @product_one.valid?, "Product is valid without a name"
  end

  test "low_stock_level must be greater than or equal to 0" do
    @product_one.low_stock_level = -1
    assert_not @product_one.valid?, "Product is valid with a negative low_stock_level"
  end

  test "has many sales" do
    assert_respond_to @product_one, :sales
    assert_equal 1, @product_one.sales.size
  end
end

