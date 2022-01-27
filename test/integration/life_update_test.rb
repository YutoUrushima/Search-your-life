require 'test_helper'

class LifeUpdateTest < ActionDispatch::IntegrationTest
  
  def setup
    @life = lives(:yuto)
  end
  
  # 名前は絶対に空白にならないので名前があればupdateは問題ない
  test "should success with valid infomation" do
    get edit_life_path(@life)
    # 画像のテスト：https://railstutorial.jp/chapters/user_microposts?version=6.0#sec-exercises_basic_image_upload
    patch life_path, params: {life: {name: "new name", year: "", month: 12, date: "", introduce: "", image: life_image}}
    assert_redirected_to life_path(@life)
    follow_redirect!
    assert_match "new name", response.body
  end
  
  # 名前が無かったらupdateはできない
  test "should fail with invalid information" do
    get edit_life_path(@life)
    patch life_path, params: {life: {name: "", year: "", month: "", date: "", introduce: "", image: life_image}}
    assert_select 'div#error_explanation'
    assert_template "lifes/edit"
  end
end
