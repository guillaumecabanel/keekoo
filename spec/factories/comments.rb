FactoryBot.define do
  factory :comment do
    association :moment
    association :user
    content { "MyText" }
  end
end
