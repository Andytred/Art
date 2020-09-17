class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :artworks
  has_many :transactions, foreign_key: 'buyer_id'
  has_many :sell_transactions, through: :artworks, source: :transactions
end
