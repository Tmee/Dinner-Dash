class CreateLineItemFillings < ActiveRecord::Migration
  def change
    create_table :line_item_fillings do |t|
      t.integer :order_id
      t.integer :item_id
    end
  end
end
