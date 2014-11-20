class CreateItemFillings < ActiveRecord::Migration
  def change
    create_table :item_fillings do |t|
      t.references :item, index: true
      t.references :filling, index: true

      t.timestamps
    end
  end
end
