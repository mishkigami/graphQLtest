require 'test_helper'

class Web::Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @product = create :product
  end

  test 'should get index products page' do
    get admin_products_path
    assert_response :success
  end

  test 'should create new product' do
    product_attrs = attributes_for :product
    post admin_products_path, params: { product: product_attrs }
    assert_response :redirect
    product = Product.last
    assert_equal product_attrs[:name], product.name
  end

  test 'should get show admin product page' do
    get admin_product_path(@product)
    assert_response :success
  end

  test 'should put update product' do
    attrs = {}
    attrs[:name] = generate :name
    put admin_product_path(@product.id), params: { product: attrs }
    assert_response :redirect
    @product.reload
    assert_equal attrs[:name], @product.name
  end

  test 'should destroy product' do
    delete admin_product_path(@product.id)
    assert_response :redirect
    assert_not Product.exists?(@product.id)
  end
end
