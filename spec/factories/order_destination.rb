FactoryBot.define do
  factory :order_destination do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '神奈川県' }
    block { '3-4' }
    building { 'ホワイトハイツ' }
    phone_number { '12345671234' }
  end
end