require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  let!(:past_events) { create_list(:event, 3, past: true) }
  let!(:future_events) { create_list(:event, 3, past: false) }

  describe 'GET /events' do
    it 'returns all events' do
      get '/api/v1/events'
      expect(json).not_to be_empty
      expect(json['data'].size).to eq(6)
      expect(response).to have_http_status(200)
    end

    it 'returns past events' do
      get '/api/v1/events?when=past'
      expect(json).not_to be_empty
      expect(json['data'].size).to eq(3)
      expect(response).to have_http_status(200)
    end

    it 'returns past events' do
      get '/api/v1/events?when=future'
      expect(json).not_to be_empty
      expect(json['data'].size).to eq(3)
      expect(response).to have_http_status(200)
    end
  end
end