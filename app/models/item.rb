class Item < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { :greater_than_or_equal_to => 0 }
  belongs_to :line_item
  has_many  :item_fillings
  has_many :fillings, through: :item_fillings
  has_attached_file :image, :styles => { :medium => "300x300#",
                                         :thumb => "100x100#"},
                    :default_url => 'onion.jpg'
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def image_name
    "menu/items/#{name.downcase.tr(' ', '_')}.jpg"
  end
end
