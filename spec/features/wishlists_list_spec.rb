require 'rails_helper'

RSpec.feature "Listing Wishlists" do

  before do
    sahu = User.create!(email: 'sahu@mail.com', password: 'password')
    login_as(sahu)
    @wishlist1 = Wishlist.create(title: "Wishlist 1", description: "Wishlist1 description", users:[sahu])
    @wishlist2 = Wishlist.create(title: "Wishlist 2", description: "Wishlist2 description", users:[sahu])
  end

  scenario "A user list all wishlists" do
    visit "/wishlists"

    expect(page).to have_content(@wishlist1.title)
    expect(page).to have_content(@wishlist2.title)
    expect(page).to have_link(@wishlist1.title)
    expect(page).to have_link(@wishlist2.title)
  end

  scenario "A user has no wishlist" do
    Wishlist.delete_all
    visit "/wishlists"

    expect(page).not_to have_content(@wishlist1.title)
    expect(page).not_to have_content(@wishlist2.title)
    expect(page).not_to have_link(@wishlist1.title)
    expect(page).not_to have_link(@wishlist2.title)

    within ("h2#no-wishlists") do
      expect(page).to have_content("No wishlists created")
    end
  end
end
