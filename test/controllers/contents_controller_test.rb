require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get edit_life_content_path
    assert_response :success
  end

end
