require 'rails_helper'

RSpec.describe "Api::V1::Todo::ItemsController", type: :request do
  let (:test_url) { '/api/v1/todo/items' }

  describe 'GET /api/v1/todo/items' do
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

  describe 'POST /api/v1/todo/items' do
    context 'when the token is valid and on the header' do
      let(:user) { FactoryBot.create(:user) }
      let(:devise_api_token) { FactoryBot.create(:devise_api_token, resource_owner: user) }
      let(:scope) { FactoryBot.create(:scope) }

      before do
        post "#{test_url}", 
          headers: authentication_headers_for(user, devise_api_token), 
          params: {
            item: {
              name: 'test',
              done: false,
              scope_id: scope.id
            }
          }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'PUT /api/v1/todo/items/:item_id' do
    context 'when the token is valid and on the header' do
      let(:user) { FactoryBot.create(:user) }
      let(:devise_api_token) { FactoryBot.create(:devise_api_token, resource_owner: user) }
      let(:item) { FactoryBot.create(:item) }

      before do
        put "#{test_url}/#{item.id}",
          headers: authentication_headers_for(user, devise_api_token),
          params: {
            item: {
              name: 'test 2',
              done: true,
              scope_id: item.scope.id
            }
          }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE /api/v1/todo/items/:item_id' do
    context 'when the token is valid and on the header' do
      let(:user) { FactoryBot.create(:user) }
      let(:devise_api_token) { FactoryBot.create(:devise_api_token, resource_owner: user) }
      let(:item) { FactoryBot.create(:item) }

      before do
        delete "#{test_url}/#{item.id}",
          headers: authentication_headers_for(user, devise_api_token)
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end