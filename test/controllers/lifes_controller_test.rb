require 'test_helper'

class LifesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @life = lives(:yuto)
  end
  
  test "should get index" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{page_common_part}"
  end

  test "should get new" do
    get new_life_path
    assert_response :success
    assert_select "title", "New | #{page_common_part}"
  end
end
