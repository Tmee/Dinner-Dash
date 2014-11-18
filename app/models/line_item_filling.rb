class LineItemFilling < ActiveRecord::Base
  belongs_to :line_item
  belongs_to :filling
end
