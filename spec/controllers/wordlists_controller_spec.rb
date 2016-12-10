require 'rails_helper'

RSpec.describe WordlistsController, type: :controller do
  let(:my_uuid) { SecureRandom.uuid }

  it 'wordlist urls are uuid-based' do
    wordlist = Wordlist.create!(title:  'Wordlist #1')

    expect("/wordlists/#{wordlist.uuid}").to eq wordlist_path(wordlist)
  end

  it 'client provided UUIDs are accepted while creating new wordlists' do
    post :create, wordlist: { uuid: my_uuid, title: 'Test Wordlist' }
    expect(response.status).to eq 200
  end

  describe '/show' do
    let(:response_body) { JSON.parse(response.body) }

    before :each do
      Wordlist.create!(title: 'Test Wordlist', uuid: my_uuid)
      get :show, id: my_uuid
    end

    it 'client provided UUIDs are accepted while finding saved Wordlists' do
      expect(response.status).to eq 200
    end

    it 'returns wordlist title' do
      expect(response_body['title']).to eq 'Test Wordlist'
    end

    it 'returns wordlist uuid' do
      expect(response_body['uuid']).to eq my_uuid
    end

    it 'does not return created_at' do
      expect(response_body.key?('created_at')).to be false
    end

    it 'does not return updated_at' do
      expect(response_body.key?('updated_at')).to be false
    end
  end
end
