FactoryBot.define do
  factory :tribe do
    title { "MyString" }
    association :user
  end
end
