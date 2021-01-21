require 'rails_helper'

RSpec.describe "Spells", type: :request do
  describe 'get/spells' do
    before(:each) do
      get '/spells'
    end
    it 'should respond with 200 success' do
      expect(response).to have_http_status(200)
    end
    it 'should respond with json' do
      expect(response.content_type).to eq("application/json; charset=utf-8") 
    end
  end

  describe 'get /spells/:id' do
    it 'should respond with json given correct if' do
      get '/spells/1'
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json; charset=utf-8") 
    end

    it 'should respond with 404 when given invalid id' do
      get '/spells/99'
      expect(response).to have_http_status(404)
      expect(response.body).to include("Could not find spell")
    end
  end

  describe 'post /spells' do
    it 'should respond with 201 created' do
      post '/spells', :params => {name:"Invisibility", description:"Turns you invisible", type: "illusion"}
      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq("application/json; charset=utf-8") 
      expect(response.body).to include("Turns you invisible")
    end
  end

  describe 'put /spells/:id' do
    it 'should respond with json given correct id' do
      put '/spells/1', :params => {name: 'Teleport', description: 'You end up somewhere else', type: 'transportation'}
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json; charset=utf-8") 
      expect(response.body).to include("You end up somewhere else") 
    end
    it 'should respond with 404 when given invalid id' do
      put '/spells/99', :params => {name: 'Teleport', description: 'You end up somewhere else', type: 'transportation'}
      expect(respronse).to have_http_status(404)
      expect(response.body).to include("Could not find spell")
    end
  end
end
