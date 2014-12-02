require "rails_helper"

feature "Admin Filling Navigation" do

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

  scenario "admin can visit the fillings page" do
    click_link "Admin Dashboard"
    expect(current_path).to eq("/admin")
    click_link "Edit Fillings"
    expect(page).to have_text("Available Ingredients")
  end

  feature "admin can interact with fillings" do

    background do
      Filling.create!(title:       "Steak",
                     description: "It's meat. From an animal.",
                     price:       100,
                     food_group:  "meats",
                    )
    end

    scenario "admin can add a new filling" do

      visit "/admin/fillings"
      click_link "Add New Filling"
      expect(page).to have_text("New Filling")

      fill_in "Title",       with: "Cake"
      fill_in "Description", with: "This is circular food."
      fill_in "Price",       with: 100
      fill_in "Food group",  with: "desserts"
      click_button "Create Filling"
      expect(page).to have_text("Cake")
    end

    scenario "admin can edit a filling" do
      visit "/admin/fillings"

      click_link "Edit"
      fill_in "Title", with: "Cake"
      click_button "Update Filling"

      expect(page).to have_text("Cake")
    end

    scenario "admin can retire a filling" do
      visit "/admin/fillings"

      retired_box = find('input[type="checkbox"]')
      retired_box.set(true)

      expect(retired_box).to be_checked
    end

    scenario "admin can delete a filling" do
      visit "/admin/fillings"
      click_link "Destroy"

      expect(page).to have_text("The filling was deleted.")
    end
  end

end
