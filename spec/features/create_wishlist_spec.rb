require 'rails_helper'

RSpec.feature "Creating Wishlists" do

  before do
    @sahu = User.create!(email: 'sahu@mail.com', password: 'password')
    login_as(@sahu)
  end

  scenario "A user creates a new wishlist" do
    visit "/"
    click_link "New Wishlist"
    fill_in "Title", with: "Wishlist1"
    fill_in "Description", with: "Lorem ipsum wishlist 1"
    click_button "Create Wishlist"

    expect(Wishlist.last.title).to eq("Wishlist1")
    expect(Wishlist.last.users.last).to eq(@sahu)
    expect(page.current_path).to eq(wishlists_path)
    expect(page).to have_css("#toast-container")

  end
end
