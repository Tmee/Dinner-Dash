class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  validates :user_id, presence: :true
  validates :state, presence: :true

  def items_purchased
    names = product_names
    modify_for_quantity(names)
    return names.sort.join(", ")
  end

  def product_names
    line_items.map do |line_item|
      line_item.item.name.split.map(&:capitalize).join(" ")
    end
  end

  def modify_for_quantity(names)
    multiple_orders = []
    quantity = Hash.new(0)

    product_names.each{ |product| quantity[product] += 1}
    quantity.each do |product, quantity|
      if quantity > 1
        multiple_orders << product
        quantity - 1.times do
          names.delete_at(names.index(product) || names.length)
        end
      end
    end

    unless multiple_orders.empty?
      multiple_orders.each do |product|
        names[names.index(product)] = "#{product} x#{quantity[product]}"
      end
    end
  end
end
