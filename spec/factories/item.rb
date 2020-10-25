FactoryBot.define do
  factory :item do
    name { 'セーター' }
    description { '去年売っていたものを探しています' }
    images { 'spec/factories/test.jpg' }
    budget { 5000 }
    deadline { "2020-10-30 09:00:00" }
    category { 'レディース' }
    status { '募集中' }
  end
  factory :item2, class: Item do
    name { 'コート' }
    description { '一昨年売っていたものを探しています' }
    images { 'spec/factories/test.jpg' }
    budget { 10000 }
    deadline { "2020-11-15 09:00:00" }
    category { 'メンズ' }
    status { '募集終了' }
  end
  factory :item3, class: Item do
    name { 'レースアップシューズ' }
    description { '2017年に売っていたもの3を探しています' }
    images { 'spec/factories/test.jpg' }
    budget { 7000 }
    deadline { "2020-11-30 09:00:00" }
    category { 'レディース' }
    status { '募集中' }
  end
end
