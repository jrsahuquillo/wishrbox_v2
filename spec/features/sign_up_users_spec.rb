require 'rails_helper'

RSpec.feature "Sign up users" do

  scenario "with valid credentials" do
    visit "/"
    page.find('a.desktop-signup').click
    fill_in "Username", with: "user"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    # expect(page).to have_content("You have signed up succesfully")
    expect(page.current_path).to eq("/")
    expect(page).to have_css("#toast-container")
  end

  scenario "with invalid credentials" do
    visit "/"
    page.find('a.desktop-signup').click
    fill_in "Username", with: ""
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Sign up"

    # expect(page).to have_content("You have not signed up succesfully")
    expect(page.current_path).to eq("/users")
  end

  scenario "with repeated credentials" do
    @sahu = User.create!(username: 'user', email: 'user@mail.com', password: 'password')
    visit "/"
    page.find('a.desktop-signup').click
    fill_in "Username", with: "user"
    fill_in "Email", with: "user@mail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Username has already been taken")
    expect(page).to have_content("Email has already been taken")
    expect(page.current_path).to eq("/users")
  end

end
