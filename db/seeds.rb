2.times do |n|
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
   name: 'レースアップシューズ',
   description: '2年前にマッキントッシュで売っていたレースアップシューズを探しています。
   ブランド：マッキントッシュ
   品番：681101 Bｶﾞﾗｽ
   色：ブラック
   どなたかお持ちでしたらコメントください。
   よろしくお願いいたします。',
   images: [open("#{Rails.root}/app/assets/images/sample2.jpg"),
     open("#{Rails.root}/app/assets/images/sample2.jpg")],
   budget: 5000,
   deadline: '2020_12_31',
   category: 'レディース',
   status: '募集中'
 )
end

User.all.each do |user|
 user.items.create!(
   name: 'スーツケース',
   description: 'グローブトロッターのサファリを探しています。
   品番：GTSAFIN30EDD
   サイズ：30インチ
   色：アイボリーホワイト
   どなたかお持ちでしたらコメントください。
   よろしくお願いいたします。',
   images: [open("#{Rails.root}/app/assets/images/sample3.jpg"),
     open("#{Rails.root}/app/assets/images/sample3.jpg")],
   budget: 100000,
   deadline: '2020_11_30',
   category: 'その他',
   status: '募集中'
 )
end

User.all.each do |user|
 user.items.create!(
   name: 'ヘッドセット',
   description: 'Boseのヘッドセットを探しています。
   メーカー；Bose
   型番：SOUNDLINKAE2BKK
   どなたかお持ちでしたらコメントください。
   よろしくお願いいたします。',
   images: [open("#{Rails.root}/app/assets/images/sample4.jpg"),
     open("#{Rails.root}/app/assets/images/sample4.jpg")],
   budget: 5000,
   deadline: '2020_12_15',
   category: '家電・スマホ・カメラ',
   status: '募集中'
 )
end

User.all.each do |user|
 user.items.create!(
   name: 'セーター',
   description: '去年ユニクロで売っていたセーターを探しています。
   品番：416622
   色：白
   どなたかお持ちでしたらコメントください。
   よろしくお願いいたします。',
   images: [open("#{Rails.root}/app/assets/images/sample1.jpg"),
     open("#{Rails.root}/app/assets/images/sample1.jpg")],
   budget: 3000,
   deadline: '2020_12_30',
   category: 'メンズ',
   status: '募集中'
 )
end
