require 'test_helper'

class Members::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get members_members_show_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get members_members_unsubscribe_url
    assert_response :success
  end

  test "should get edit" do
    get members_members_edit_url
    assert_response :success
  end

end
