require 'test_helper'

class LifesLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @life = lives(:yuto)
  end
  
  # 不正な情報でログイン
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: {email: @life.email, password: "invalid"}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    assert_not is_logged_in?
    get root_path
    assert flash.empty?
  end
  
  # 有効な情報でログインして、ログアウトまでを検証する
  test "login with valid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: {email: @life.email, password: "password"}}
    assert_redirected_to @life
    follow_redirect!
    assert_template 'lifes/show'
    assert is_logged_in?
    assert_not flash.empty?
    get root_path
    assert flash.empty?
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_not flash.empty?
    # ２番めのウィンドウでログアウトをクリックするユーザーをシミュレートする
    # https://railstutorial.jp/chapters/advanced_login?version=6.0#sec-two_subtle_bugs
    delete logout_path
    follow_redirect!
    assert_not flash.empty?
  end
  
  test "login with remembering" do
    log_in_as(@life, remember_me: '1')
    assert_not_empty cookies[:remember_token]
  end
  
  test "login without remembering" do
    # cookiesを保存してログイン(cookiesの初期化)
    log_in_as(@life, remember_me: '1')
    delete logout_path
    # cookiesを削除してログイン
    log_in_as(@life, remember_me: '0')
    assert_empty cookies[:remember_token]
  end
end
