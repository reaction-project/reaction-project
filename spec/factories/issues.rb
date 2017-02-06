FactoryGirl.define do
  factory :issue do
    name { Faker::Name.name }

    trait :invalid do
      name nil
    end

    trait :with_icon do
      icon File.open('spec/fixtures/files/icon.png')
    end
  end
end
