require 'test_helper'

class LifesHelperTest < ActionView::TestCase
    
    def setup
        @life = lives(:yuto)
    end
    
    # ユーザーの年/月/日が登録されている場合はdisplay_life_ageメソッドを利用して適切な誕生日が返って来る
    test 'display correct age' do
        birthdays = [
            { name: "father", date: "1966/9/17", age: 55 },
            { name: "mother", date: "1968/9/24", age: 53 },
            { name: "me", date: "1996/12/20", age: 25 },
            { name: "old_sister", date: "1999/7/24", age: 22 },
            { name: "young_sister", date: "2002/4/5", age: 19 },
            { name: "former", date: "1996/2/19", age: 26 },
            { name: "today", date: "1996/2/20", age: 26 },
            { name: "later", date: "1996/2/21", age: 25 }
        ]
        birthdays.each do |birthday|
            @life.year = birthday[:date].split('/')[0]
            @life.month = birthday[:date].split('/')[1]
            @life.date = birthday[:date].split('/')[2]
            result = display_life_age(@life)
            assert_equal birthday[:age], result, "#{birthday[:name].inspect} has wrong birthday"
        end
    end
    
    test 'return false when life does not any information' do
        @life.year = '1996'
        @life.month = '12'
        @life.date = nil
        result = display_life_age(@life)
        assert_not result
    end
end