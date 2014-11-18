class CreateFillings < ActiveRecord::Migration
  def change
    create_table :fillings do |t|
      t.string  :title
      t.string  :description
      t.string  :photo
      t.integer :price
    end
  end
end
