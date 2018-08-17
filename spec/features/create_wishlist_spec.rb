require 'rails_helper'

RSpec.feature "Creating Wishlists" do

  before do
    @sahu = User.create!(email: 'sahu@mail.com', password: 'password')
    login_as(@sahu)

    visit "/"
    click_link "New Wishlist"
  end

  scenario "A user creates a new wishlist" do

    fill_in "Title", with: "Wishlist1"
    fill_in "Description", with: "Lorem ipsum wishlist 1"
    click_button "Create Wishlist"

    expect(Wishlist.last.title).to eq("Wishlist1")
    expect(Wishlist.last.users.last).to eq(@sahu)
    expect(page.current_path).to eq(wishlists_path)
    expect(page).to have_css("#toast-container")

  end

  scenario "A user fails to create a untitled wishlist" do

    fill_in "Title", with: ""
    fill_in "Description", with: "Lorem ipsum wishlist 1"
    click_button "Create Wishlist"

    expect(page).to have_content("Title can't be blank")
    expect(page.current_path).to eq(wishlists_path)
    expect(page).to have_css("#toast-container")
  end

  scenario "A user fails to create a wishlist with repeated title" do

    fill_in "Title", with: "Wishlist 1"
    fill_in "Description", with: "Lorem ipsum wishlist 1"
    click_button "Create Wishlist"
    click_link "New Wishlist"
    fill_in "Title", with: "Wishlist 1"
    fill_in "Description", with: "Lorem ipsum wishlist 1"
    click_button "Create Wishlist"

    expect(page).to have_content("Title has already been taken")
    expect(page.current_path).to eq(wishlists_path)
    expect(page).to have_css("#toast-container")
  end

  scenario "A user fails to create a wishlist with more than 30 characters in title" do

    fill_in "Title", with: "This a wish list with more than 30 characters"
    fill_in "Description", with: "Lorem ipsum wishlist 1"
    click_button "Create Wishlist"

    expect(page).to have_content("Title is too long (maximum is 30 characters)")
    expect(page.current_path).to eq(wishlists_path)
    expect(page).to have_css("#toast-container")
  end

  scenario "A user fails to create a wishlist with less than 3 characters in title" do

    fill_in "Title", with: "W"
    fill_in "Description", with: "Lorem ipsum wishlist 1"
    click_button "Create Wishlist"

    expect(page).to have_content("Title is too short (minimum is 3 characters)")
    expect(page.current_path).to eq(wishlists_path)
    expect(page).to have_css("#toast-container")
  end
end
