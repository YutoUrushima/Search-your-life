require 'test_helper'

class LifeTest < ActiveSupport::TestCase
  def setup
    @life = Life.new(email: "example@example.com", password: "password", password_confirmation: "password")
  end
  
  # ユーザーの妥当性のテスト
  test "should be valid" do
    assert @life.valid?
  end
  
  # ユーザーのメールアドレスは存在する必要がある
  test "email should be present" do
    @life.email = ""
    assert_not @life.valid?
  end
  
  # メールアドレスを255文字以内に収める
  test "email should not be too long" do
    @life.email = "a" * 244 + "@example.com"
    assert_not @life.valid?
  end
  
  # メールアドレスが有効なアドレスか検証する
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @life.email = valid_address
      assert @life.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @life.email = invalid_address
      assert_not @life.valid? "#{invalid_address.inspect} should be invalid"
    end
  end
end
