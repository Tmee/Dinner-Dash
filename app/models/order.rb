class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :fillings, through: :line_item_fillings

  validates :user_id, presence: :true
  validates :state, presence: :true

  def items
    line_items.map { |line_item| line_item.item.name.capitalize }.join(", ")
  end
end
