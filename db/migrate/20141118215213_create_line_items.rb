class CreateLineItem < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :item_id
    end
  end
end
