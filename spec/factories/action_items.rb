FactoryGirl.define do
  factory :action_item do
    title { Faker::Lorem.sentence }
    event { [true, false].sample }
    issue
    category

    trait :invalid do
      title nil
    end

    trait :with_image do
      icon File.open('spec/fixtures/files/image.jpg')
    end
  end
end
