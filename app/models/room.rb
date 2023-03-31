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

  scope :largest, -> {order(floor_area: :desc)}
  scope :smallest, -> {order(floor_area: :asc)}
  scope :newest, -> { includes(:building).order("buildings.build_year DESC") }
  scope :oldest, -> { includes(:building).order("buildings.build_year ASC") }
  scope :highest, -> {order(rent: :desc)}
  scope :lowest, -> {order(rent: :asc)}
end
