class AddRetiredToFilling < ActiveRecord::Migration
  def change
    add_column :fillings, :retired, :boolean, :default => false
  end
end
