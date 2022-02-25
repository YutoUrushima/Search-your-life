require 'test_helper'

class LifesIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @life = lives(:yuto)
  end
  
  # ページネーションのテスト
  test 'index including pagination' do
    log_in_as(@life)
    get root_path
    assert_template 'lifes/index'
    assert_select 'div.pagination', count: 2
    Life.paginate(page: 1).each do |life|
      # assert_select 'a[href=?]', life_path(life)
      assert_select 'h3', text: life.name
    end
  end
end
