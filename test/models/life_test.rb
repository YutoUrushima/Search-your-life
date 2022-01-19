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
end
