FactoryBot.define do
  factory :item do
    name { "MyString" }
    purchase_date { "2022-01-17 22:53:07" }
    description { "MyText" }
    user_id { 1 }
  end
end
