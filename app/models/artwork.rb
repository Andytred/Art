class Artwork < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  has_one_attached :photo
  validates :photo, presence: :true
end
