require 'test_helper'

class LifeRegistrationTest < ActionDispatch::IntegrationTest
  
  def setup
    @life = lives(:new_life)
  end
  
  test "valid new life registration" do
    get new_life_path
    post lifes_path, params: {life: {name: "うる", email: "abc@exmaple.com", password: "foobar", password_confirmation: "foobar"}}
    assert_redirected_to root_path
    follow_redirect!
    assert_not flash.empty?
  end
end
