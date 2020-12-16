FactoryBot.define do
  factory :user do
    nickname { 'alice' }
    password { 'password' }

    sequence(:email) { |n| "user_#{n}@example.com" }
  end
end
