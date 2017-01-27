FactoryGirl.define do
  factory :issue do
    name { Faker::Name.name }

    trait :invalid do
      name nil
    end
  end
end
