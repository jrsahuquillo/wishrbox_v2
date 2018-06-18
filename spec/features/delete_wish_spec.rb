require 'rails_helper'

RSpec.feature "Deleting a Wish" do

  before do
    sahu = User.create!(email: 'sahu@mail.com', password: 'password')
    login_as(sahu)
    @wish = Wish.create(title: "Wish1", description: "Wish1 description", user: sahu)
  end

  scenario "A user deletes a existing wish" do
    visit "/"
    click_link @wish.title
    click_link "delete"

    # expect(page).to have_content("Wish has been deleted")
    expect(page).to have_css("#toast-container")
    expect(page.current_path).to eq(wishes_path)

  end
end
