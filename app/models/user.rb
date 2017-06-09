class User < ApplicationRecord
  has_secure_password

  has_many :sent_requests, foreign_key: 'buyer_id', class_name: 'Request'
  has_many :received_requests, foreign_key: 'seller_id', class_name: 'Request'
  
  has_many :items_as_seller, foreign_key: "user_id", class_name: "Item"
  has_many :items_as_buyer, through: :sent_requests, source: :item

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
