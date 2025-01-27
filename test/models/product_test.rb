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
  # test "the truth" do
  #   assert true
  # end
end
