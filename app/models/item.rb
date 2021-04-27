class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :category_id
    validates :item_condition_id
    validates :postage_type_id
    validates :prefecture_id
    validates :preparation_day_id
  end

  belongs_to :user
  has_one :purchase_history
  has_one_attached :image
end