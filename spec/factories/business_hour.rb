FactoryBot.define do
    factory :business_hour do
        id { 2 }
        day { 3 }
        open { Time.now - 5.hours}
        close  { Time.now + 2.hours }
        opened { true }
        shop_id { 1 }
        created_at { Time.now - 6.hours }
        updated_at { Time.now - 6.hours }
    end
  end