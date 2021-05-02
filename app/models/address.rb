class Address < ApplicationRecord
  # with_options presence: true do
  #   validates :post_code
  #   validates :city
  #   validates :house_number
  #   validates :phone_number
  # end
  # validates :building_name
  # validates :prefecture_id, numericality: { other_than: 1 }

  belongs_to :purchase_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
