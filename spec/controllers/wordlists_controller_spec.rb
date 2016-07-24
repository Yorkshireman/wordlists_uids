require 'rails_helper'

RSpec.describe WordlistsController, type: :controller do
  it 'wordlist urls are uuid-based' do
    wordlist = Wordlist.create!(title:  'Wordlist #1')

    expect("/wordlists/#{wordlist.uuid}").to eq wordlist_path(wordlist)
  end
end
