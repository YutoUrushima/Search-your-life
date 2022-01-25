require 'test_helper'

class LifeRegistrationTest < ActionDispatch::IntegrationTest
  
  def setup
    @life = lives(:new_life)
  end
  
  test "valid new life registration" do
    get new_life_path
    assert_template 'new'
    post lifes_path, params: {life: {name: "うる", email: "abc@exmaple.com", password: "foobar", password_confirmation: "foobar"}}
    assert_redirected_to root_path
    assert_not flash.empty?
    # ユーザーの基本情報の登録
    get life_path(@life)
    assert_template 'show', partial: 'lifes/_basic-form'
    # inputタグが無い
    # https://zariganitosh.hatenablog.jp/entry/20080405/1207455670
    # assert_select 'form input[name="life[name]"]'
    # 画像のテスト：https://railstutorial.jp/chapters/user_microposts?version=6.0#sec-exercises_basic_image_upload
    image = fixture_file_upload('test/fixtures/kitten.jpg', 'image/jpeg')
    patch life_path(@life), params: {life: {name: "うる", year: 1996, month: 12, date: 20, introduce: "developer", image: image}}
    assert_template 'show'
    assert_not flash.empty?
  end
end
