require 'rails_helper'

RSpec.feature "Creating Wishes" do
  scenario "A user creates a new wish" do
    visit "/"
    click_link "add"
    fill_in "Title", with: "Creating a wish"
    fill_in "Description", with: "Lorem ipsum wishes"
    click_button "Create Wish"

    # expect(page).to have_content("Wish has been created")
    expect(page.current_path).to eq(wishes_path)
    expect(page).to have_css("#toast-container") #TODO: Try to test page has content "Wish has been created"
  end

  scenario "A user fails to create a new wish" do
    visit "/"
    click_link "add"
    fill_in "Title", with: ""
    fill_in "Description", with: ""
    click_button "Create Wish"

    expect(page).to have_content("Title can't be blank")
    expect(page.current_path).to eq(wishes_path)
    expect(page).to have_css("#toast-container")
  end
end
