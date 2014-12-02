require 'rails_helper'

RSpec.describe Filling, :type => :model do
  let(:filling) do
    Filling.new(title: "Carnitas",
             description: "Hot and porky",
             price: 3,
             food_group: "meats",
             retired: true
             )
  end

  it "is valid" do
    expect(filling).to be_valid
  end

  it 'is invalid without a title' do
    filling.title = nil
    expect(filling).not_to be_valid

    filling.title = ""
    expect(filling).not_to be_valid
  end

  it 'is invalid without a description' do
    filling.description = nil
    expect(filling).not_to be_valid

    filling.description = ""
    expect(filling).not_to be_valid
  end

  it 'is invalid without a price' do
    filling.price = nil
    expect(filling).not_to be_valid
  end

  it 'is invalid without a food group' do
    filling.food_group = nil
    expect(filling).not_to be_valid
  end

  it 'must have a price that is a decimal greater than zero' do
    filling.price = -2
    expect(filling).not_to be_valid
  end

  it 'cannot create a filling with the same title' do
    filling1 = Filling.create(title: "Lettuce", description: "Crispy", price: 1, food_group: "Vegetables")
    filling2 = Filling.create(title: "Lettuce", description: "Crispy", price: 1, food_group: "Vegetables")

    expect(filling2).not_to be_valid
  end

  it 'is associated with a item' do
    expect(filling).to respond_to(:items)
  end

  it 'is associated with a line item' do
    expect(filling).to respond_to(:line_items)
  end

  it "is valid with a retired state of true" do
    filling.retired = true
    expect(filling).to be_valid
  end

  it "is valid with a retired state of false" do
    filling.retired = false
    expect(filling).to be_valid
  end

  it "invalid without a retired state" do
    filling.retired = nil
    expect(filling).to_not be_valid
  end

  it "can display it's view title" do
    filling.title = "this is a title"
    expect(filling.view_title).to eq("This Is A Title")
  end

end
