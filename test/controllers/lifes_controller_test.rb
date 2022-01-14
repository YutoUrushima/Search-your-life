require 'test_helper'

class LifesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @common_title = "Search your life"
  end
  
  test "should get index" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@common_title}"
  end

  test "should get new" do
    get new_life_path
    assert_response :success
    assert_select "title", "New | #{@common_title}"
  end
  
  test "should get login" do
    get login_path
    assert_response :success
    assert_select "title", "Login | #{@common_title}"
  end
end
