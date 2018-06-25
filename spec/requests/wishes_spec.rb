require "rails_helper"

RSpec.feature "Wishes", type: :request do
  before do
    @sahu = User.create(username: 'sahuqui', email: 'sahu@mail.com', password: 'password')
    @clara = User.create(username: 'claramon', email: 'clara@mail.com', password: 'password')
    @wish = Wish.create!(title: "Wish1", description: "Wish1 description", user: @sahu)
  end

  describe 'GET /wishes/:id/edit' do

    context 'with existing wish' do
      before do
        login_as(@sahu)
        get "/wishes/#{@wish.id}/edit"
      end

      it 'handles existing wish and access to wish edition succesfully' do
        expect(response.status).to eq 200
      end
    end

    context 'with non-signed-in user' do
      before { get "/wishes/#{@wish.id}/edit" }

      it 'redirects to the sign-in page' do
        expect(response.status).to eq 302
        flash_message = "You need to sign in or sign up before continuing."
        expect(flash[:alert]).to eq flash_message
      end
    end

    context 'with signed-in user who is non-owner' do
      before do
        login_as(@clara)
        get "/wishes/#{@wish.id}/edit"
      end

      it 'redirects to the home page' do
        expect(response.status).to eq 302
        flash_message = "You can only edit your own wish"
        expect(flash[:alert]).to eq flash_message
      end
    end

    context 'with non-existing wish' do

      before do
        login_as(@sahu)
        get "/wishes/xxxx/edit"
      end

      it 'handles non-existing wish' do
        expect(response.status).to eq 302
        flash_message = "The wish you are looking for could not be found"
        expect(flash[:alert]).to eq flash_message
      end
    end

  end

end
