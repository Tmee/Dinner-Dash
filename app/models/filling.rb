class Filling < ActiveRecord::Base
  validates :description, :food_group, presence: true
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { :greater_than_or_equal_to => 0 }
  validates :retired, inclusion: { in: [true, false] }
  has_many  :line_item_fillings
  has_many  :line_items, through: :line_item_fillings
  has_many  :item_fillings
  has_many :items, through: :item_fillings
  has_attached_file :image, :styles => { :medium => "300x300#",
                                         :thumb => "100x100#"},
                                         :default_url => 'hermano.jpg'
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  scope :active, -> {where(retired: false)}

  def view_title
    title.split.map(&:capitalize).join(" ")
  end

  def view_price
    price.to_s.length < 3 ? "$#{price.to_s.insert(0, ".")}" : "$#{price.to_s.insert(-3, ".")}"
  end
end
