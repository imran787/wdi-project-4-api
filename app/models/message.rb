class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates_presence_of :body, :conversation_id, :user_id
  # Validates that the specified attributes are not blank , and, if the attribute is an association, that the associated object is not marked for destruction. Happens by default on save.

  # method here to display the time it was created at
  def message_time
    created_at.strftime('%m/%d/%y at %l:%M %p')
  end
end
