FactoryGirl.define do
  factory :goal do
    title {Faker::Lorem.sentence(word_count=3)}
    body {Faker::Lorem.paragraph}
    private_goal false
    completed false
    user_id -1
  end

end
