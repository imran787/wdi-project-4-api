class Request < ApplicationRecord
  belongs_to :item

before_create :save_default_status
  private
#setting status field
  def save_default_status
    self.status = 'pending'
  end
end
