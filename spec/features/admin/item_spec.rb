require "rails_helper"

feature "Admin Item Navigation" do

  background do
    admin_user = User.create!(first_name: "Josh",
    last_name:  "Cheek",
    email:      "demo+josh@jumpstartlab.com",
    username:   "josh",
    password:   "password"
    )
    admin = Role.new(name: "admin")
    admin_user.roles = [admin]

    visit '/'
    fill_in "username", with: admin_user.username
    fill_in "password", with: admin_user.password
    find('input[type="submit"]').click
  end

  scenario "admin can log in" do
    expect(page).to have_text("Josh")
  end

  scenario "admin can visit the items page" do
    click_link "Admin Dashboard"
    expect(current_path).to eq("/admin")
    click_link "Edit Items"
    expect(page).to have_text("Available Items")
  end

  feature "admin can interact with items" do

    background do
      Item.create!(name:        "Cake",
                   description: "It's not a lie. We promise.",
                   price:       700,
                  )
    end

    scenario "admin can add a new item" do
      visit "/admin/items"
      click_link "Add New Item"
      expect(page).to have_text("New Item")


    end

  end

end
