require 'test_helper'

class LifesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get show" do
    get life_path
    assert_response :success
  end

  test "should get new" do
    get new_life_path
    assert_response :success
  end

  test "should get edit" do
    get edit_life_path
    assert_response :success
  end

end
