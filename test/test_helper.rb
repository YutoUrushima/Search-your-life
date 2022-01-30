ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  # ユーザーの画像を返す
  def life_image
    fixture_file_upload('test/fixtures/kitten.jpg', 'image/jpeg')
  end
  
  # ページタイトルの共通部分を返却する
  def page_common_part
    "Search your life"
  end
  
  # テストユーザーがログイン中の場合にtrueを返す
  def is_logged_in?
    !session[:current_user].nil?
  end
end
