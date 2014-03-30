FactoryGirl.define do
  factory :vote do
    candidate  { build(:candidate) }
    email      { Faker::Internet.email }
   end
    
end