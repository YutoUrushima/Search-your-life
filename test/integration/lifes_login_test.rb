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
    get root_path
    assert flash.empty?
  end
  
  # 有効な情報でログイン
  test "login with valid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: {email: @life.email, password: "password"}}
    assert_redirected_to @life
    follow_redirect!
    assert_template 'lifes/show'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
