class Item < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { :greater_than_or_equal_to => 0 }
  belongs_to :line_item

  def image_name
    "menu/items/#{name.downcase.tr(' ', '_')}.jpg"
  end
end
