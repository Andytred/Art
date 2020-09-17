class Transaction < ApplicationRecord
  belongs_to :buyer, class_name: "User", foreign_key: :buyer_id
  belongs_to :artwork

  def accept!
    self.confirmation = "accepted"
    self.save
  end

  def reject!
    self.confirmation = "rejected"
    self.save
  end
end
