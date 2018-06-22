require 'rails_helper'

RSpec.feature "Editing Wishes" do

  before do
    sahu = User.create!(username: 'sahu', email: 'sahu@mail.com', password: 'password')
    @wish = Wish.create(title: "Wish1", description: "Wish1 description", user: sahu)
    login_as(sahu)
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
    expect(page).to have_css("#edit-button-modal1", text: 'edit')
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

  scenario "A user can not update another user wish" do
    user1 = User.create!(username: 'user1', email: 'user1@mail.com', password: 'password')
    @wish1 = Wish.create(title: "Wish1", description: "Wish1 description", user: user1)
    user2 = User.create!(username: 'user2', email: 'user2@mail.com', password: 'password')
    @wish2 = Wish.create(title: "Wish2", description: "Wish2 description", user: user2)
    login_as(user1)

    visit "/"
    click_link @wish2.title

    expect(page).not_to have_css(".modal-footer #edit-button-modal1", text: 'edit')
  end

end
