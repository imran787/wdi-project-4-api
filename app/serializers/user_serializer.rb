class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :password_digest

  # requests
  has_many :sent_requests
  has_many :received_requests

  # items
  has_many :items_as_seller
  has_many :items_as_buyer

  # messages
  has_many :sent_messages
  has_many :received_messages
end
