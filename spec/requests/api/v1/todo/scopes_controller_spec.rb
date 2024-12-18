require 'rails_helper'

RSpec.describe "Api::V1::Todo::ScopesController", type: :request do
  let (:test_url) { '/api/v1/todo/scopes' }

  describe 'GET /api/v1/todo/scopes' do
    context 'when the token is valid and on the header' do
      let(:user) { FactoryBot.create(:user) }
      let(:devise_api_token) { FactoryBot.create(:devise_api_token, resource_owner: user) }

      before do
        get "#{test_url}", headers: authentication_headers_for(user, devise_api_token)
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST /api/v1/todo/scopes' do
    context 'when the token is valid and on the header' do
      let(:user) { FactoryBot.create(:user) }
      let(:devise_api_token) { FactoryBot.create(:devise_api_token, resource_owner: user) }

      before do
        post "#{test_url}", 
          headers: authentication_headers_for(user, devise_api_token), 
          params: {
            scope: {
              name: 'test',
              nickname: 'test'
            }
          }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'PUT /api/v1/todo/scopes/:scope_id' do
    context 'when the token is valid and on the header' do
      let(:user) { FactoryBot.create(:user) }
      let(:devise_api_token) { FactoryBot.create(:devise_api_token, resource_owner: user) }
      let(:scope) { FactoryBot.create(:scope) }

      before do
        put "#{test_url}/#{scope.id}",
          headers: authentication_headers_for(user, devise_api_token),
          params: {
            scope: {
              name: 'test',
              nickname: 'test 2'
            }
          }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE /api/v1/todo/scopes/:scope_id' do
    context 'when the token is valid and on the header' do
      let(:user) { FactoryBot.create(:user) }
      let(:devise_api_token) { FactoryBot.create(:devise_api_token, resource_owner: user) }
      let(:scope) { FactoryBot.create(:scope) }

      before do
        delete "#{test_url}/#{scope.id}",
          headers: authentication_headers_for(user, devise_api_token)
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end