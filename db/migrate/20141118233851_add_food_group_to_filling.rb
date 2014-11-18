class AddFoodGroupToFilling < ActiveRecord::Migration
  def change
    add_column :fillings, :food_group, :string
  end
end
