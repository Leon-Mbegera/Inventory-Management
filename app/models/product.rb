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
class Product < ApplicationRecord
  has_one_attached :image
  has_many :sales, dependent: :destroy

  scope :search_with, lambda { |q|
    where('name ILIKE ?', "%#{q}%")
  }
end
