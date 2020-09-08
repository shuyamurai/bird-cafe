FactoryBot.define do
  factory :item do
    association :user
    name                  { 'testgoodsname' }
    url                   { 'test.amazon.url' }
    code                  { '1111111111' }
    description           { 'テスト商品の紹介文' }
  end
end