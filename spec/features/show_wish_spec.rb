require 'rails_helper'

RSpec.feature "Showing a wish" do

  before do
    sahu = User.create!(username: 'sahuqui', email: 'sahu@mail.com', password: 'password')
    login_as(sahu)
    @wish = Wish.create(title: "Wish1", description: "Wish1 description", user: sahu)
  end

  scenario 'A user shows a wish in a modal' do
    visit '/'

    page.find('#modal' + (@wish.id.to_s)).click

    expect(page).to have_content(@wish.title)
    expect(page).to have_content(@wish.description)
  end

end
