# test/controllers/admin/products_controller_test.rb
require 'test_helper'

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:product_one)
  end

  test "should get index" do
    get admin_products_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count', 1) do
      post admin_products_url, params: { product: { name: 'New Product', price: 10.0, quantity: 100, description: 'Test Description' } }
    end
    assert_redirected_to admin_products_path
  end

  test "should show product" do
    get admin_product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch admin_product_url(@product), params: { product: { name: 'Updated Product', price: 12.0, quantity: 150, description: 'Updated Description' } }
    assert_redirected_to admin_product_path(@product)
  end
end
