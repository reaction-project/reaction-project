FactoryGirl.define do
  factory :feature do
    position 0
    action

    trait :invalid do
      position nil
    end
  end
end
