3.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: false
               )
end

User.create!(name: "AdminUser",
             email: "admin@example.com",
             password: 'password',
             password_confirmation: 'password',
             admin: true
             )

User.all.each do |user|
 user.items.create!(
   name: 'コート',
   description: '〇〇のコートを探しています。
   品番は〇〇
   どなたかお持ちでしたらコメントください。
   よろしくお願いいたします。',
   images: [open("#{Rails.root}/app/assets/images/sample5.jpg"),
     open("#{Rails.root}/app/assets/images/sample5.jpg"),
     open("#{Rails.root}/app/assets/images/sample5.jpg")],
   budget: 10000,
   deadline: 2020_11_31,
   category: 'レディース',
   status: '募集中'
 )
end

User.all.each do |user|
 user.items.create!(
   name: 'レースアップシューズ',
   description: '2年前に売っていたレースアップシューズを探しています。
   メーカー：〇〇
   品番は〇〇
   色：ブラック
   どなたかお持ちでしたらコメントください。
   よろしくお願いいたします。',
   images: [open("#{Rails.root}/app/assets/images/sample2.jpg"),
     open("#{Rails.root}/app/assets/images/sample2.jpg"),
     open("#{Rails.root}/app/assets/images/sample2.jpg")],
   budget: 5000,
   deadline: 2020_10_31,
   category: 'レディース',
   status: '募集中'
 )
end

User.all.each do |user|
 user.items.create!(
   name: 'スーツケース',
   description: 'グローブトロッターのスーツケースを探しています。
   品番は〇〇
   サイズ：〇〇
   色：ネイビー
   どなたかお持ちでしたらコメントください。
   よろしくお願いいたします。',
   images: [open("#{Rails.root}/app/assets/images/sample3.jpg"),
     open("#{Rails.root}/app/assets/images/sample3.jpg"),
     open("#{Rails.root}/app/assets/images/sample3.jpg")],
   budget: 50000,
   deadline: 2020_11_7,
   category: 'その他',
   status: '募集中'
 )
end

User.all.each do |user|
 user.items.create!(
   name: 'ヘッドセット',
   description: '〇〇のヘッドセットを探しています。
   メーカー；〇〇
   型番は〇〇
   どなたかお持ちでしたらコメントください。
   よろしくお願いいたします。',
   images: [open("#{Rails.root}/app/assets/images/sample4.jpg"),
     open("#{Rails.root}/app/assets/images/sample4.jpg"),
     open("#{Rails.root}/app/assets/images/sample4.jpg")],
   budget: 5000,
   deadline: 2020_11_15,
   category: '家電・スマホ・カメラ',
   status: '募集中'
 )
end

User.all.each do |user|
 user.items.create!(
   name: 'セーター',
   description: '去年〇〇で売っていたセーターを探しています。
   品番：〇〇
   色：白
   どなたかお持ちでしたらコメントください。
   よろしくお願いいたします。',
   images: [open("#{Rails.root}/app/assets/images/sample1.jpg"),
     open("#{Rails.root}/app/assets/images/sample1.jpg"),
     open("#{Rails.root}/app/assets/images/sample1.jpg")],
   budget: 3000,
   deadline: 2020_10_30,
   category: 'メンズ',
   status: '募集中'
 )
end
