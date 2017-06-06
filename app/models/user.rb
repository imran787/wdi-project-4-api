class User < ApplicationRecord
  has_secure_password

  has_many :items
  has_many :sent_requests, foreign_key: 'buyer_id', class_name: 'Request'
  has_many :received_requests, foreign_key: 'seller_id', class_name: 'Request'


  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
