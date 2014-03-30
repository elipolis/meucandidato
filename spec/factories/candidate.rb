FactoryGirl.define do
  factory :candidate do
    name Faker::Name.name
    number_of_unique_votes 0
  end
end