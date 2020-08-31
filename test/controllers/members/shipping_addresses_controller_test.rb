require 'test_helper'

class Members::ShippingAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_shipping_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get members_shipping_addresses_edit_url
    assert_response :success
  end

end
