FactoryBot.define do
  factory :order do
    state { "MyString" }
    amount { "" }
    checkout_session_id { "MyString" }
    cart { nil }
  end
end
