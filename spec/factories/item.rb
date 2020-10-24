FactoryBot.define do
  factory :item do
    name { 'セーター' }
    description { '去年売っていたものを探しています' }
    budget { 5000 }
    status { '募集中' }
  end
  factory :item2, class: Item do
    name { 'セーター2' }
    description { '去年売っていたもの2を探しています' }
    status { '募集終了' }
  end
  factory :item3, class: Item do
    name { 'セーター3' }
    description { '去年売っていたもの3を探しています' }
    status { '募集中' }
  end
end
