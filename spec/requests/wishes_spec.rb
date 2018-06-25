require "rails_helper"

RSpec.feature "Wishes", type: :request do
  before do
    sahu = User.create!(username: 'sahuqui', email: 'sahu@mail.com', password: 'password')
    login_as(sahu)
    @wish = Wish.create(title: "Wish1", description: "Wish1 description", user: sahu)
  end

  describe 'GET /wishes/:id/edit' do
    context 'with existing wish' do
      before { get "/wishes/#{@wish.id}/edit" }

      it 'handles existing wish' do
        expect(response.status).to eq 200
      end
    end

    context 'with non-existing wish' do
      before { get "/wishes/xxxx/edit" }

      it 'handles non-existing wish' do
        expect(response.status).to eq 302
        flash_message = "The wish you are looking for could not be found"
        expect(flash[:danger]).to eq flash_message
      end
    end
  end


end
