require "rails_helper"

feature "Admin can retire a filling" do


  before(:each) do
    admin_user = User.create!(first_name: "Josh",
                              last_name:  "Cheek",
                              email:      "demo+josh@jumpstartlab.com",
                              username:   "josh",
                              password:   "password"
                             )
    admin = Role.create!(name: "admin")
    admin_user.roles = [admin]

    visit '/'
    fill_in "username", with: "josh"
    fill_in "password", with: "password"
    find('input[type="submit"]').click
  end

  scenario "admin can log in" do
    expect(page).to have_text("Josh")
  end

  scenario "admin can visit the fillings page" do
    click_link "Admin Dashboard"
  end

end
