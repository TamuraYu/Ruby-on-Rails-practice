FactoryGirl.define do
  factory :user do
    sequence(:user_name){|n| "tam#{n}"}
    sequence(:mail){|n| "tam#{n}@test.com"}
    gender 0
    birthday 30.years.ago
    password "passw0rd"
    password_confirmation "passw0rd"
  end
end