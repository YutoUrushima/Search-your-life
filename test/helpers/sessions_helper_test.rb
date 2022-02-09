require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
    
    def setup
        @life = lives(:yuto)
        remember(@life)
    end
    
    test "current_user returns right life when session is nil" do
        assert_equal @life, current_user
        assert is_logged_in?
    end
    
    test "current_user returns nil when remember_digest is wrong" do
        @life.update_attribute(:remember_digest, Life.digest(Life.new_token))
        assert_nil current_user
    end
end