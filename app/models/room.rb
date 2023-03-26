class Room < ApplicationRecord
  belongs_to :admin
  belongs_to :building
  has_one_attached :image

  with_options presence: true do
    validates :room_number, numericality: { only_integer: true }
    validates :rent, numericality: { only_integer: true }
    validates :management_fee, numericality: { only_integer: true }
    validates :deposit, numericality: { only_integer: true }
    validates :key_money, numericality: { only_integer: true }
    validates :layout
    validates :floor_area, format: { with: /\A\d+(\.\d{1})?\z/, message: "must be a number with one decimal place or less" }
    validates :available_date
    validates :image
  end
end
