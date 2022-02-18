require 'test_helper'

class LifeShowTest < ActionDispatch::IntegrationTest
  
  def setup
    @life = lives(:yuto)
    @another = lives(:hanako)
  end
  
  # 現在のログインユーザーのshowページに編集ボタンが表示されるか確認
  test 'display button with login life' do
    get login_path
    post login_path, params: { session: {email: @life.email, password: "password", password_confirmation: "password"}}
    assert_redirected_to @life
    follow_redirect!
    assert_template "lifes/show"
    assert_select 'a.btn' do
      assert_select 'a.btn-primary' do
        assert_select 'a.btn-wide', text: "編集する"
      end
    end
  end
  
  # 現在のログインユーザーとは別のユーザーのページでは編集ボタンを表示させない
  test 'not display button with login another life'do   
    get login_path
    log_in_as(@life, password: 'password')
    assert_redirected_to @life
    follow_redirect!
    assert_template "lifes/show"
    get life_path(@another)
    assert_template "lifes/show"
    assert_select 'a.btn', count: 0, text: "編集する"
  end
end
