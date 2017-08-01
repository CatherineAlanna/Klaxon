FactoryGirl.define do
  sequence(:id) { |n| "#{n}" }

  factory :product do
    id
    name "anything"
    description "anything"
    price "20"
    color "Blue"
  end
end