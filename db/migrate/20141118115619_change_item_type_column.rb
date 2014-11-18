class ChangeItemTypeColumn < ActiveRecord::Migration
  def change
    rename_column :items, :type, :food_group
  end
end
