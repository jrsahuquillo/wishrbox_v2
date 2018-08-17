require 'rails_helper'

RSpec.feature "Sign in users" do

  before do
    @sahu = User.create!(username: 'sahuqui', email: 'sahu@mail.com', password: 'password')
  end

  scenario "with valid credentials" do
    visit "/wishes"
    page.find('a.desktop-login').click
    fill_in "Email", with: @sahu.email
    fill_in "Password", with: @sahu.password
    click_button "Log in"

    expect(page.current_path).to eq("/wishes")
    expect(page).to have_css("#toast-container")
    expect(page).not_to have_css('a.desktop-login')
    expect(page).not_to have_css('a.mobile-login')
    expect(page).not_to have_css('a.desktop-signup')
    expect(page).not_to have_css('a.mobile-signup')
    expect(page).to have_content('Logged in as sahuqui')
  end

  scenario "with invalid credentials" do
    visit "/wishes"
    page.find('a.desktop-login').click
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    click_button "Log in"

    expect(page.current_path).to eq("/users/sign_in")
    expect(page).to have_css("#toast-container")

  end
end
