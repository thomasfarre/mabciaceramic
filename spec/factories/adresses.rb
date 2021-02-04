FactoryBot.define do
  factory :adress do
    user { nil }
    country { "MyString" }
    street { "MyString" }
    streetDetail { "MyString" }
    zipcode { 1 }
    phone { 1 }
    city { "MyString" }
  end
end
