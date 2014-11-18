class LineItem < ActiveRecord::Base
  belongs_to :item
  has_many   :line_item_fillings
  has_many   :fillings, through: :line_items
end
