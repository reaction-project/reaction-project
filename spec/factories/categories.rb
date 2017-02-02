FactoryGirl.define do
  factory :category do
    name { Faker::Name.name }

    trait :invalid do
      name nil
    end
  end
end
