FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "#{n}#{Faker::Internet.email}"
    end

    password { Faker::Internet.password }

    trait :admin do
      role User.roles[:admin]
    end

    trait :invalid do
      email nil
    end

    after(:create) do |user|
      user.profile = create(:profile, user: user)
    end
  end
end
