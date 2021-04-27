class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_condition_id
    validates :postage_type_id
    validates :prefecture_id
    validates :preparation_day_id
  end

  belongs_to :user
  has_one :purchase_history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_type
  belongs_to :prefecture_id
  belongs_to :preparation_day
end