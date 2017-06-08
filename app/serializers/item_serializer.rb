class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :value, :image, :buyer, :seller
  has_many :requests
end
