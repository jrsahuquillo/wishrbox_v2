require 'rails_helper'

RSpec.feature "Editing Wishes" do

  before do
    @wish = Wish.create(title: "Wish1", description: "Wish1 description")
  end

  scenario "A user updates a wish" do
    visit "/"
    click_link @wish.title
    click_link "edit"

    fill_in "Title", with: "Updated Wish1 title"
    fill_in "Description", with: "Updated Wish1 description"
    click_button "Update Wish"

    # expect(page).to have_content("Wish has been updated")
    expect(page).to have_css("#toast-container")
    expect(page.current_path).to eq(wishes_path)
  end

  scenario "A user fails to update a wish" do
    visit "/"
    click_link @wish.title
    click_link "edit"

    fill_in "Title", with: ""
    fill_in "Description", with: "Updated Wish1 description"
    click_button "Update Wish"

    expect(page).to have_content("Wish Title can't be blank")
    expect(page.current_path).to eq(wish_path(@wish))
  end

end
