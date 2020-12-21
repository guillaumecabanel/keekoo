FactoryBot.define do
  factory :moment do
    association :user
    association :tribe
  end
end
