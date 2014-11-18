class ChangeItemModelName < ActiveRecord::Migration
  def change
    rename_table :items, :fillings
  end
end
