require 'rails_helper'

RSpec.describe Item, :type => :model do
  let(:item) do 
    Item.new(title: "Carnitas", 
             description: "Hot and porky", 
             price: 3, 
             food_group: "Meat"
             )
  end

  it "is valid" do 
    expect(item).to be_valid
  end

  it 'is invalid without a title' do 
    item.title = nil
    expect(item).not_to be_valid

    item.title = ""
    expect(item).not_to be_valid
  end

  it 'is invalid without a description' do 
    item.description = nil
    expect(item).not_to be_valid

    item.description = ""
    expect(item).not_to be_valid
  end

  it 'is invalid without a price' do 
    item.price = nil
    expect(item).not_to be_valid
  end

  it 'is invalid without a food group' do 
    item.food_group = nil
    expect(item).not_to be_valid
  end

  it 'must have a price that is a decimal greater than zero' do 
    item.price = -2
    expect(item).not_to be_valid
  end

  it 'cannot create a item with the same title' do
    item1 = Item.create(title: "Lettuce", description: "Crispy", price: 1, food_group: "Vegetables")
    item2 = Item.create(title: "Lettuce", description: "Crispy", price: 1, food_group: "Vegetables")

    expect(item2).not_to be_valid
  end

  xit 'is associated with a category' do
    expect(phone_number).to respond_to(:contact)
  end

end
