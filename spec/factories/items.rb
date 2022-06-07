FactoryBot.define do
  factory :item do
    name { "MyString" }
    category { "MyString" }
    purchase_date { "2022-03-04" }
    price { 1 }
    description { "MyText" }
    user { nil }
  end
end
