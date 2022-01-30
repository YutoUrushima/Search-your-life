# メインのサンプルユーザーを１人作成する
Life.create!( name: "うる", year: 1996, month: 12, date: 20, introduce: "Developer", image: "/user_images/profile.jpg", 
            email: "yuto@example.co.jp", password: "yuto1220", password_confirmation: "yuto1220")
            

# 追加のユーザーをまとめて生成する
99.times do |n|
    name = Faker::Name.name
    email = "example#{n}-user@example.co.jp"
    password = "password"
    image = Faker::Gender.binary_type == "男性" ? "/user_images/profile#{rand(4..6)}.jpg" : "/user_images/profile#{rand(1..3)}.jpg"
    Life.create!(name: name, image: image, email: email, password: password, password_confirmation: password)
end
