class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  validates :user_id, presence: :true
  validates :state, presence: :true

  def items
    product_names = line_items.map do |line_item|
      line_item.item.name.split.map(&:capitalize).join(" ")
      end
      product_names.sort.join(", ")
  end
end
