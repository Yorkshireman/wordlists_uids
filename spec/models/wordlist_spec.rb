require 'rails_helper'

RSpec.describe Wordlist, type: :model do
  let(:wordlist) { described_class.create!(title: 'Test Wordlist') }

  context 'when a UUID is not provided during creation' do
    it 'a UUID is generated on creation' do
      expect(wordlist.uuid).to_not be nil
    end

    it 'UUID is different between instances' do
      wordlist_2 = described_class.create!(title: 'Test Wordlist #2')
      expect(wordlist.uuid).to_not eq wordlist_2.uuid
    end
  end

  context 'when a UUID is provided during creation' do
    let(:my_uuid) { SecureRandom.uuid }
    let(:wordlist) do
      described_class.create!(title: 'Test Wordlist', uuid: my_uuid)
    end

    it 'a UUID is not generated on creation' do
      expect(my_uuid).to eq wordlist.uuid
    end
  end

  it "an instance's uuid cannot be updated" do
    expect { wordlist.update!(uuid: SecureRandom.uuid) }.to raise_error(
      ActiveRecord::RecordInvalid, "Validation failed: Uuid can't be updated"
    )
  end

  it 'is searchable by the uuid primary key' do
    uuid = wordlist.uuid
    expect(described_class.find(uuid)).to eq wordlist
  end
end
