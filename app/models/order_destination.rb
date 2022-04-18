class OrderDestination
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id
  
  with_options presence: true do
    validates :token, presence: true
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は不正な値です。ハイフンを含めて入力してください'}
    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'は不正な値です' }
    validates :item_id
    validates :user_id
  end

  def save
    order= Order.create(item_id: item_id, user_id: user_id)
    Destination.create(
      post_code: post_code, prefecture_id: prefecture_id, 
      city: city, block: block, building: building, phone_number: phone_number, order_id: order.id
    )
  end
end