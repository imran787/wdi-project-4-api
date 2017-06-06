class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :value, :image
end
