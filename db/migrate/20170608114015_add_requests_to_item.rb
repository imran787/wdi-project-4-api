class AddRequestsToItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :requests, foreign_key: true
  end
end
