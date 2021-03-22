FactoryBot.define do
  factory :result do
    subjects { Faker::Name.name }
    association :student
  end
end