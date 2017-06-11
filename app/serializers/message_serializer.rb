class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :read
  has_one :user
  has_one :conversation
end
