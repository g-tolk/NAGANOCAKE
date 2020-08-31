require 'test_helper'

class Members::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get members_orders_new_url
    assert_response :success
  end

  test "should get complete" do
    get members_orders_complete_url
    assert_response :success
  end

  test "should get index" do
    get members_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get members_orders_show_url
    assert_response :success
  end

end
