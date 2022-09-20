require 'rails_helper'

RSpec.describe 'Artists', type: :request do
  describe 'GET /index' do
    before { get '/artists' }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders template' do
      expect(response).to render_template('index')
    end
    it 'contains artist nickname' do
      expect(response.parsed_body).to include('nazar')
    end
    it 'contains artist description' do
      expect(response.parsed_body).to include('desc test')
    end
  end
end
