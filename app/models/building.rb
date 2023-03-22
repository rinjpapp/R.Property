class Building < ApplicationRecord
  belongs_to :admin
  has_many :rooms

  with_options presence: true do
    validates :building_name
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :access
    validates :build_year
    validates :story, numericality: { only_integer: true }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
