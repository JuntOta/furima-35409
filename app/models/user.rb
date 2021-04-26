class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
    validates :nickname
    VALID_NAME = /\A[ぁ-んァ-ン一-龥々ー]+\z/
    validates :family_name, format: { with: VALID_NAME}
    validates :first_name, format: { with: VALID_NAME}
    VALID_NAME_KANA = /\A([ァ-ン]|ー)+\z/
    validates :family_name_kana, format: { with: VALID_NAME_KANA}
    validates :first_name_kana, format: { with: VALID_NAME_KANA}
    validates :birthday
  end
  has_many :items
  has_many :purchase_histories
end

