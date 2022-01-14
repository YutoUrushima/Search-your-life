require 'test_helper'

class LifesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get new" do
    get new_life_path
    assert_response :success
  end
  
  test "should get login" do
    get login_path
    assert_response :success
  end
end
