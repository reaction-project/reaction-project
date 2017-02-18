FactoryGirl.define do
  factory :profile do
    user

    trait :invalid do
      user nil
    end
  end
end
