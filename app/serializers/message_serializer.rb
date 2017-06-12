class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :sender_id, :receiver_id
  has_one :sender
  has_one :receiver
end
