class RequestSerializer < ActiveModel::Serializer
  attributes :id, :buyer_id, :seller_id, :status, :item_id
  has_one :item

end
