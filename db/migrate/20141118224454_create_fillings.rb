class CreateFillings < ActiveRecord::Migration
  def change
    create_table :fillings do |t|
      t.string  :title
      t.string  :description
      t.string  :photo
      t.integer :price
      t.string  :type

      t.timestamps
    end
  end
end
