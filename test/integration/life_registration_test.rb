require 'test_helper'

class LifeRegistrationTest < ActionDispatch::IntegrationTest
  
  def setup
    @life = lives(:new_life)
  end
  
  test "valid new life registration" do
    get new_life_path
    assert_template 'new'
    post lifes_path, params: {life: {email: "abc@exmaple.com", password: "foobar", password_confirmation: "foobar"}}
    assert_redirected_to root_path
    assert_not flash.empty?
    # ユーザーの基本情報の登録
    get life_path(@life)
    assert_template 'show', partial: 'lifes/_basic-form'
    # assert_select 'input[name=?]', 'life[name]'
  end
end
