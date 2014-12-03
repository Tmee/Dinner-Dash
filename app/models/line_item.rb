class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  has_many   :line_item_fillings
  has_many   :fillings, through: :line_item_fillings

  def self.highest_selling_product
    LineItem.all.group_by(&:item_id).max_by {|key, value| value.count } || [-1, []]
  end

end
