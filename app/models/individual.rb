class Individual < ApplicationRecord
  belongs_to :user, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :phone

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }
    validates :birth_day
    validates :phone_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, numericality: { only_integer: true }, length: { in: 10..11 }
  end
end
