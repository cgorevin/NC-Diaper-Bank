FactoryGirl.define do
  factory :admin do
    
  end
    factory :hotspot do
        title Faker::Company.name
        street_address Faker::Address.street_address
        city Faker::Address.city
        state Faker::Address.state
        zip_code Faker::Address.zip_code
        phone_number Faker::PhoneNumber.phone_number
     end
end