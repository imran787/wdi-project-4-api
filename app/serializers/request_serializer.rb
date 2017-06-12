class RequestSerializer < ActiveModel::Serializer
  attributes :id, :buyer_id, :seller_id, :status, :item_id, :item, :body
  has_one :item
end
