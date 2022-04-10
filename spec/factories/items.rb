FactoryBot.define do
  factory :item do
    items_name { Faker::Lorem.characters(number: 40) }
    description { Faker::Lorem.characters(number: 1000) }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_date_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
