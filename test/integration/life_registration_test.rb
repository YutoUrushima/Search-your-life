require 'test_helper'

class LifeRegistrationTest < ActionDispatch::IntegrationTest
  
  def setup
    @life = lives(:new_life)
  end
  
  # 有効な情報とともにユーザー登録
  test "registration with valid information" do
    get new_life_path
    assert_difference 'Life.count', 1 do
      post lifes_path, params: {life: {name: "うる", email: "abc@exmaple.com", password: "foobar", password_confirmation: "foobar"}}
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_not flash.empty?
  end
  
  # 無効な情報とともにユーザー登録
  test "registration with invalid information" do
    get new_life_path
    assert_no_difference 'Life.count' do
      post lifes_path, params: {life: {name: "", email: "abc@exmaple.com", password: "foobar", password_confirmation: "foobaz"}}
    end
    assert_template 'new'
    assert_not flash.empty?
  end
end
