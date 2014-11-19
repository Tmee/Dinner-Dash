class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :line_item_fillings, :order_id, :line_item_id
    rename_column :line_item_fillings, :item_id, :filling_id
  end
end
