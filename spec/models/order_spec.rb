require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:order) do
    Order.create(user_id: 1, state: "completed")
  end

  it "is valid" do
    expect(order).to be_valid
  end

  it "is invalid without a user_id" do
    order.user_id = nil
    expect(order).to_not be_valid

    order.user_id = ""
    expect(order).to_not be_valid
  end

  it "is invalid without a state" do
    order.state = nil
    expect(order).to_not be_valid

    order.state = ""
    expect(order).to_not be_valid
  end

  it "is associated with a user" do
    expect(order).to respond_to(:user)
  end

end
