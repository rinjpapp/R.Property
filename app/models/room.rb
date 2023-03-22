class Room < ApplicationRecord
  belongs_to :admin
  belongs_to :building

  with_options presence: true do
    validates :room_number
    validates :rent
    validates :management_fee
    validates :deposit
    validates :key_money
    validates :layout
    validates :floor_area
    validates :available_date
  end
end
