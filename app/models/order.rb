class Order < ActiveRecord::Base
  scope :ordered, -> { where(state: "ordered")}
  scope :paid, -> { where(state: "paid")}
  scope :cancelled, -> { where(state: "canceled")}
  scope :completed, -> { where(state: "completed")}

  belongs_to :user
  has_many :line_items

  validates :user_id, presence: :true
  validates :state, presence: :true

  def items_purchased
    names = product_names
    modify_for_quantity(names)
    return names.sort.join(", ")
  end

  def order_total
    item_total = line_items.reduce(0) do |sum, line_item|
      sum + (line_item.item.price * line_item.quantity)
    end

    fillings_total = line_items.reduce(0) do |sum, line_item|
      sum + (line_item.fillings.reduce(0) do |sum, filling|
        sum + (filling.price * line_item.quantity)
      end)
    end
    item_total + fillings_total
  end

  def self.total_revenue
    paid_orders.reduce(0) { |sum, order| sum + order.order_total }
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

  private

  def self.paid_orders
    completed.merge(paid)
  end
end
