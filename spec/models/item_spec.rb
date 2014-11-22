require 'rails_helper'

RSpec.describe Item, :type => :model do
  let(:item) do 
    Item.new(name: "Burrito",
             price: 500,
             )
  end

  it "is valid" do 
    expect(item).to be_valid
  end

  it "is invalid without a name" do 
    item.name = nil
    expect(item).not_to be_valid
  end

  it 'must have a price that is a decimal greater than zero' do 
    item.price = -3
    expect(item).not_to be_valid
  end

  it 'has fillings' do 
    expect(item).to respond_to(:fillings)
  end


end