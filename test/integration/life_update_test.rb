require 'test_helper'

class LifeUpdateTest < ActionDispatch::IntegrationTest
  
  def setup
    @life = lives(:yuto)
  end
  
  # 成功するテスト
  test "should success with valid infomation" do
    log_in_as(@life)
    get edit_life_path(@life)
    name = "new name"
    year = 1996
    month = 12
    date = 20
    introduce = "new introduce"
    # 画像のテスト：https://railstutorial.jp/chapters/user_microposts?version=6.0#sec-exercises_basic_image_upload
    patch life_path(@life), params: {life: {name: name, year: year, month: month, date: date, introduce: introduce, image: life_image}}
    assert_not flash.empty?
    assert_redirected_to life_path(@life)
    @life.reload
    assert_equal name, @life.name
    assert_equal year, @life.year
    assert_equal month, @life.month
    assert_equal date, @life.date
    assert_equal introduce, @life.introduce
  end
  
  # 失敗するテスト（名前だけは必ず入力がある必要がある）
  test "should fail with invalid information" do
    log_in_as(@life)
    get edit_life_path(@life)
    patch life_path(@life), params: {life: {name: "", year: 1996, month: 12, date: 20, introduce: "new introduce", image: life_image}}
    assert_template "lifes/edit"
    assert_not flash.empty?
    assert_select 'div#error_explanation'
  end
end
