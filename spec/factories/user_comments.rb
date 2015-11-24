FactoryGirl.define do
  factory :user_comment do
    body Faker::Lorem.sentence(5)
    author_id -1
    user_id -1
  end

end
