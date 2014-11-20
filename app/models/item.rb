class Item < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { :greater_than_or_equal_to => 0 }
  belongs_to :line_item
  has_many  :item_fillings
  has_many :fillings, through: :item_fillings

  def filling_list
    fillings
  end

  
end
