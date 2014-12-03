class AddAddresses < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_method, :string
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :zip_code, :integer
    add_column :users, :state, :string
    add_column :users, :city, :string
  end
end
