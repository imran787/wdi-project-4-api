class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.references :item, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
