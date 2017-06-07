class Item < ApplicationRecord
  has_many :requests
  belongs_to :seller, :class_name => "User", :foreign_key => :user_id
  belongs_to :buyer, :class_name => "User", :foreign_key => :user_id
end
