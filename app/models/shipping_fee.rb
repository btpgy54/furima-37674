class ShippingFee < ApplicationRecord
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い（購入者負担）' },
    { id: 3, '送料込み（出品者負担）' }
  ]

  include ActiveHash::Associations
  has_many :items
end
