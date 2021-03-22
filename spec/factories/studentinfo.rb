FactoryBot.define do
  factory :studentinfo do
    name { Faker::Name.name }
    address { Faker::Address.city }
    
    phoneNo { Faker::PhoneNumber.phone_number }

    gender { Faker::Gender.type }

    dob { Faker::Date.birthday(min_age: 5) }
    
  end
end