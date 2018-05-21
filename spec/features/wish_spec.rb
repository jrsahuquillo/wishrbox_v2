require 'rails_helper'

RSpec.feature "Creating Wishes" do
  scenario "A user creates a new wish" do
    visit "/"
    click_link "New Wish"
    fill_in "Title", with: "Creating a wish"
    fill_in "Description", with: "Lorem ipsum wishes"
    click_button "Create Wish"

    expect(page.current_path).to eq(wishes_path)
    expect(page).to have_css("#toast-container") #TODO: Try to test page has content "Wish has been created"
  end
end
