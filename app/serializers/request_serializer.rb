class RequestSerializer < ActiveModel::Serializer
  attributes :id, :buyer_id, :seller_id, :status
  has_one :item
end
