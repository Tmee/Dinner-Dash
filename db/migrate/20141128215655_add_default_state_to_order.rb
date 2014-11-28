class AddDefaultStateToOrder < ActiveRecord::Migration
  def change
    change_column_default :orders, :state, "ordered"
  end
end
