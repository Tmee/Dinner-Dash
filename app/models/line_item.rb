class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  has_many   :line_item_fillings
  has_many   :fillings, through: :line_item_fillings
end
