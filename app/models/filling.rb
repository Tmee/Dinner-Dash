class Filling < ActiveRecord::Base
  validates :description, :food_group, presence: true
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { :greater_than_or_equal_to => 0 }
  has_many  :line_item_fillings
  has_many  :line_items, through: :line_item_fillings
  has_many  :item_fillings
  has_many :items, through: :item_fillings
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
