FactoryBot.define do
  factory :contact do
    type { "" }
    first_name { "MyString" }
    last_name { "MyString" }
    phone_number { "MyString" }
    shop { nil }
  end
end
