require 'test_helper'

class Web::ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get products_path
    assert_response :success
  end
end
