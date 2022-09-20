require 'rails_helper'

RSpec.describe 'ArtWorks', type: :request do
  describe 'GET /artists/1/art-works' do
    before do
      sign_in User.first
      get '/artists/1/art-works'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders template' do
      expect(response).to render_template('index')
    end

    it 'contains image title' do
      expect(response.parsed_body).to include('test img 1')
    end
  end

  describe 'GET /art_works/new' do
    context 'when authorized' do
      before do
        sign_in User.first
        get '/art_works/new'
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders template' do
        expect(response).to render_template('new')
      end

      it 'contains submit button' do
        expect(response.parsed_body).to include('Create Art work')
      end
    end

    context 'when unauthorized' do
      before do
        get '/art_works/new'
      end

      it 'returns redirect success' do
        expect(response).to have_http_status(:found)
      end

      it 'redirects to login' do
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  describe 'GET /art_works/1/edit' do
    before do
      sign_in User.first
      get '/art_works/1/edit'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders template' do
      expect(response).to render_template('edit')
    end

    it 'contains submit button' do
      expect(response.parsed_body).to include('Update Art work')
    end
  end

  describe 'DELETE /art_works/1' do
    context 'when authorized' do
      before do
        sign_in User.first
      end

      it 'deletes art work' do
        expect { delete '/art_works/1' }.to(change(ArtWork, :count).by(-1))
      end
    end

    context 'when unauthorized' do
      before { delete '/art_works/1' }

      it 'redirects to login' do
        expect(response).to redirect_to('/users/sign_in')
      end
    end

    context 'when wrong user' do
      before do
        sign_in User.last
        delete '/art_works/1'
      end

      it 'redirects to root' do
        expect(response).to redirect_to('/')
      end
    end
  end
end
