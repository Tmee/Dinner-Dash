require "rails_helper"

feature "Admin Item Navigation" do

  background do
    admin = User.create!(first_name: "Josh",
                         last_name:  "Cheek",
                         email:      "demo+josh@jumpstartlab.com",
                         username:   "josh",
                         password:   "password"
                        )
    admin_role = Role.new(name: "admin")
    admin.roles = [admin_role]

    visit '/'
    fill_in "username", with: admin.username
    fill_in "password", with: admin.password
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

      Filling.create!(title:       "Steak",
                      description: "It's meat. From an animal.",
                      price:       100,
                      food_group:  "meats",
                     )
    end

    scenario "admin can go to the new item page" do
      visit "/admin/items"
      click_link "Add New Item"
      expect(page).to have_text("New Item")
    end

    scenario "admin can make a new item" do
      visit "/admin/items/new"

      steak_checkbox = find('input[type="checkbox"]')
      steak_checkbox.set(true)
      expect(steak_checkbox).to be_checked

      fill_in "Name", with: "Cake"
      fill_in "Price", with: 100

      click_button "Create Item"
      # expect(page.status_code).to eq(200)
      # expect(current_path).to eq(admin_items_path)
      # expect(Item.last.name).to eq("Cake")
      # expect(page).to have_text("Cake")

    end


  end

end

# save_and_open_page
