class CreateUserItemFilling < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :username
      t.string   :password_digest

      t.timestamps
    end

    create_table :fillings do |t|
      t.string   :title
      t.string   :description
      t.integer  :price
      t.string   :type

      t.timestamps
    end

    create_table :items do |t|
      t.string   :name
      t.integer  :price

      t.timestamps
    end

    create_table :line_items do |t|
      t.integer  :order_id
      t.integer  :item_id

      t.timestamps
    end

    create_table :line_item_fillings do |t|
      t.integer  :order_id
      t.integer  :item_id

      t.timestamps
    end
  end
end
