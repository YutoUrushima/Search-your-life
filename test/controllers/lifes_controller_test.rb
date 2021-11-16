require 'test_helper'

class LifesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lifes_index_url
    assert_response :success
  end

  test "should get show" do
    get lifes_show_url
    assert_response :success
  end

  test "should get new" do
    get lifes_new_url
    assert_response :success
  end

  test "should get edit" do
    get lifes_edit_url
    assert_response :success
  end

end
