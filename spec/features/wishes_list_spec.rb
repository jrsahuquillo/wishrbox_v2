require 'rails_helper'

RSpec.feature "Creating Wishes" do

  before do
    @wish1 = Wish.create(title: "Wish1", description: "Wish1 description")
    @wish2 = Wish.create(title: "Wish2", description: "Wish2 description")
  end

  scenario "A user list all wishes" do
    visit "/"

    expect(page).to have_content(@wish1.title)
    expect(page).to have_content(@wish2.title)
    expect(page).to have_link(@wish1.title)
    expect(page).to have_link(@wish2.title)
  end

  scenario "A user has no wishes" do
    Wish.delete_all
    visit "/"

    expect(page).not_to have_content(@wish1.title)
    expect(page).not_to have_content(@wish2.title)
    expect(page).not_to have_link(@wish1.title)
    expect(page).not_to have_link(@wish2.title)

    within ("h2#no-wishes") do
      expect(page).to have_content("No wishes created")
    end
  end
end
