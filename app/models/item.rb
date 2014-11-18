class Item < ActiveRecord::Base
  validates :description, :food_group, presence: true
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { :greater_than_or_equal_to => 0 }
end
