FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'testing123' }

    trait :admin do
      role User.roles[:admin]
    end

    trait :invalid do
      email nil
    end
  end
end
