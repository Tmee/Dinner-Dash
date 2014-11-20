class Order < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: :true
  validates :state, presence: :true
end
