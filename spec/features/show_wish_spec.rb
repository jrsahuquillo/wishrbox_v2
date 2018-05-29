require 'rails_helper'

RSpec.feature "Showing a wish" do

  before do
    @wish = Wish.create(title: "Wish1", description: "Wish1 description")
  end

  scenario 'A user shows a wish in a modal' do
    visit '/'
    page.find('#modal' + @wish.id.to_s).click

    expect(page).to have_content(@wish.title)
    expect(page).to have_content(@wish.description)
  end

end
