require 'test_helper'

class Members::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get members_products_top_url
    assert_response :success
  end

  test "should get index" do
    get members_products_index_url
    assert_response :success
  end

  test "should get show" do
    get members_products_show_url
    assert_response :success
  end

end
