class Order < ActiveRecord::Base
  scope :ordered, -> { where(state: "ordered")}
  scope :paid, -> { where(state: "paid")}
  scope :cancelled, -> { where(state: "cancelled")}
  scope :completed, -> { where(state: "completed")}


  belongs_to :user
  has_many :line_items

  validates :user_id, presence: :true
  validates :state, presence: :true

  def items
    line_items.map { |line_item| line_item.item.name.capitalize }.join(", ")
  end
end
