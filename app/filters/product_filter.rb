class ProductFilter < AllFutures::Base
  attribute :product_name, :string

  def scope
    Product.search_with(product_name)
  end
end
