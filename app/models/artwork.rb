class Artwork < ApplicationRecord
  belongs_to :user
  has_many :transactions
end
