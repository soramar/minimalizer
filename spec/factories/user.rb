FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "testname#{n}" }
    sequence(:email) { |n| "testuser#{n}@i.jp" }
    sequence(:password) { |n| "password" }
    sequence(:password_confirmation) { |n| "password" }
  end
end
