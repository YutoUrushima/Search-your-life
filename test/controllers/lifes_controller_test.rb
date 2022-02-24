require 'test_helper'

class LifesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @life = lives(:yuto)
    @another_life = lives(:hanako)
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
  
  test "should get show" do
    get life_path(@life)
    assert_response :success
    assert_select "title", "Show | #{page_common_part}"
  end
  
  # ログインしていない状態であればeditページからログインページへリダイレクト
  test 'should redirect edit when not logged in' do
    get edit_life_path(@life)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  # ログインしていない状態であればupdateアクションからログインページへリダイレクト
  test 'should redirect update when not logged in' do
    patch life_path(@life), params: {life: {name: "new name", year: 1996, month: 12, date: 20, introduce: "new introduce", image: life_image}}
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  # 正しいユーザーでないとルートへリダイレクト(edit)
  test 'should redirect edit when logged in as wrong life' do
    log_in_as(@another_life)
    get edit_life_path(@life)
    assert_redirected_to root_url
  end
  
  # 正しいユーザーでないとルートへリダイレクト(update)
  test 'should redirect update when logged in as wrong life' do
    log_in_as(@another_life)
    patch life_path(@life), params: {life: {name: @life.name}}
    assert_redirected_to root_url
  end
end
