require 'test_helper'

class LifeTest < ActiveSupport::TestCase
  def setup
    @life = Life.new(mail: "example@example.com", password: "password", password_confirmation: "password")
  end
  
  # ユーザーの妥当性のテスト
  test "should be valid" do
    assert @life.valid?
  end
  
  # ユーザーのメールアドレスは存在する必要がある
  test "mail should be present" do
    @life.mail = ""
    assert_not @life.valid?
  end
end
