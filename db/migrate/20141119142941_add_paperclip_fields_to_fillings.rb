class AddPaperclipFieldsToFillings < ActiveRecord::Migration
  def change
    add_column :fillings, :image_file_name, :string
    add_column :fillings, :image_content_type, :string
    add_column :fillings, :image_file_size, :integer
    add_column :fillings, :image_updated_at, :datetime
  end
end
