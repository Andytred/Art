class Transaction < ApplicationRecord
  belongs_to :buyer, class_name: "User", foreign_key: :buyer_id
  belongs_to :artwork
end
