require 'rails_helper'

RSpec.feature "Deleting a Wish" do

  before do
    sahu = User.create!(email: 'sahu@mail.com', password: 'password')
    login_as(sahu)
    @wish = Wish.create(title: "Wish1", description: "Wish1 description", user: sahu)
  end

  scenario "A user deletes a existing wish" do
    visit "/wishes"
    click_link @wish.title
    expect(page).to have_css("#delete-button-modal1", text: 'delete')
    click_link "delete"

    # expect(page).to have_content("Wish has been deleted")
    expect(page).to have_css("#toast-container")
    expect(page.current_path).to eq(wishes_path)

  end

  scenario "A user can not delete another user wish" do
    user1 = User.create!(username: 'user1', email: 'user1@mail.com', password: 'password')
    @wish1 = Wish.create(title: "Wish1", description: "Wish1 description", user: user1)
    user2 = User.create!(username: 'user2', email: 'user2@mail.com', password: 'password')
    @wish2 = Wish.create(title: "Wish2", description: "Wish2 description", user: user2)
    login_as(user1)

    visit "/wishes"
    click_link @wish2.title

    expect(page).not_to have_css(".modal-footer #delete-button-modal1", text: 'delete')
  end
end
