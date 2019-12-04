FactoryGirl.define do
  factory :article do
    sequence(:title)  { |n| "Article#{n}" }
    body "boooooooody"
    released_at 2.weeks.ago
    expired_at 2.weeks.from_now
  end
end