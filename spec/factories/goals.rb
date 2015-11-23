FactoryGirl.define do
  factory :goal do
    title {Faker::Lorem.sentence(word_count=3)}
    body {Faker::Lorem.paragraph}
    public_view true
    completed false
  end

end
