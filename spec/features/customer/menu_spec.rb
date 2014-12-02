require "rails_helper"

describe 'unregistered user', type: :feature do 

  let(:item) {Item.create!(name: "Burrito", price: 500)}
  let(:filling) {Filling.create!(title:       "Steak",
                     description: "It's meat. From an animal.",
                     price:       100,
                     food_group:  "meats",
                 )}

  before(:each) do
      item.filling_ids = [filling.id]
  end

  it "can browse the menu" do 
    visit '/'
    click_link_or_button("Browse Full Menu")
    expect(page).to have_text("Which will you choose?")

    click_link_or_button("Show")
    expect(page).to have_text("Steak")
  end

  it 'can build an item' do 
    visit '/'
    click_link_or_button("Build a Burrito")
    expect(page).to have_text("Build your Burrito")
    
    check("Steak")
    click_link_or_button("Submit")
    expect(current_path).to eq("/cart")
    expect(page).to have_text("Please Log In to complete your order")
  end

end



# describe 'unregistered user', type: :feature do 

#   background do
#     registered_user = User.create!(first_name: "Jeff",
#                               last_name:  "Casimir",
#                               email:      "demo+j3@jumpstartlab.com",
#                               username:   "j3",
#                               password:   "password"
#                              )
#     user = Role.new(name: "registered user")
#     registered_user.roles = [user]

#     visit '/'
#     fill_in "username", with: registered_user.username
#     fill_in "password", with: registered_user.password
#     find('input[type="submit"]').click
#   end

# end
