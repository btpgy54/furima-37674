class OrderDestination
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id
  
  with_options presence: true do
    validates :token, presence: true
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, length: { in: 10..11}, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid.' }
    validates :item_id
  end
  validate :building

  def save
    Order.create(item_id: item_id, user_id: user_id)
    Destination.create(
      post_code: post_code, prefecture_id: prefecture_id, 
      city: city, block: block, building: building, phone_number: phone_number
    )
  end
end