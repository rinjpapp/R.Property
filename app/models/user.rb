class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status

  with_options presence: true do
    validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :nickname
  end

  has_one :individual
  has_many :favorites

  def favorite_find(room_id)
    favorites.where(room_id: room_id).exists?
  end
end
