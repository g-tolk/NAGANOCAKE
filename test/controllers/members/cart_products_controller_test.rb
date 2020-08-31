require 'test_helper'

class Members::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_cart_products_index_url
    assert_response :success
  end

end
