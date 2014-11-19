class ChangeFillingPriceDefault < ActiveRecord::Migration
  def change
    change_column_default(:fillings, :price, 0)
  end
end
