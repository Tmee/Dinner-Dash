class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  validates :user_id, presence: :true
  validates :state, presence: :true
end
