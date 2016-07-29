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

  it 'client provided UUIDs are accepted while finding saved Wordlists' do
    wordlist = Wordlist.create!(title: 'Test Wordlist', uuid: my_uuid)
    get :show, { id: my_uuid }
    expect(response.status).to eq 200
  end
end
