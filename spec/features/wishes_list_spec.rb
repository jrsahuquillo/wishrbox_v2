require 'rails_helper'

RSpec.feature "Listing Wishes" do

  before do
    sahu = User.create!(email: 'sahu@mail.com', password: 'password')
    login_as(sahu)
    @wish1 = Wish.create(title: "Wish1", description: "Wish1 description", user: sahu)
    @wish2 = Wish.create(title: "Wish2", description: "Wish2 description", user: sahu)
  end

  scenario "A user list all wishes" do
    visit "/wishes"

    expect(page).to have_content(@wish1.title)
    expect(page).to have_content(@wish2.title)
    expect(page).to have_link(@wish1.title)
    expect(page).to have_link(@wish2.title)
  end

  scenario "A user has no wishes" do
    Wish.delete_all
    visit "/wishes"

    expect(page).not_to have_content(@wish1.title)
    expect(page).not_to have_content(@wish2.title)
    expect(page).not_to have_link(@wish1.title)
    expect(page).not_to have_link(@wish2.title)

    within ("h2#no-wishes") do
      expect(page).to have_content("No wishes created")
    end
  end
end
