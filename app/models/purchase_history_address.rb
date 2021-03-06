class PurchaseHistoryAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :city, :house_number, :phone_number, :building_name,
  :prefecture_id, :purchase_history_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, numericality: {only_integer: true}, length: { maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end
  
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, city: city, house_number: house_number, phone_number: phone_number,
      building_name: building_name, prefecture_id: prefecture_id, purchase_history_id: purchase_history.id)
  end
end
