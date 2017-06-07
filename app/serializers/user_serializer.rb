class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :password_digest
  has_many :items_as_seller
  has_many :sent_requests
  has_many :received_requests
  has_many :items_as_buyer
end
