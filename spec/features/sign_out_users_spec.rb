require 'rails_helper'

RSpec.feature "Sign out logged in users" do

  before do
    @sahu = User.create!(email: 'sahu@mail.com', password: 'password')
    visit "/"
    page.find('a.desktop-login').click
    fill_in "Email", with: @sahu.email
    fill_in "Password", with: @sahu.password
    click_button "Log in"
  end

  scenario do
    visit "/"
    page.find('a.desktop-signout').click

    # expect(page).to have_content("Signed out succesfully")
    expect(page).not_to have_css('a.desktop-signout')
    expect(page).not_to have_css('a.mobile-signout')
  end


end
