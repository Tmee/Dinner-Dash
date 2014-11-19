class RemoveTypeFromFilling < ActiveRecord::Migration
  def change
    remove_column :fillings, :type, :string
  end
end
