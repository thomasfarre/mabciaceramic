FactoryBot.define do
  factory :item do
    title { "MyString" }
    description { "MyText" }
    category { "MyString" }
    status { "MyString" }
    materials { "MyString" }
    width { 1 }
    length { 1 }
    height { 1 }
  end
end
