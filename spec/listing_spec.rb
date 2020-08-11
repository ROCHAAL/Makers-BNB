require 'listing'

describe Listing do
  let(:listing) {Listing.new(id: 1, address: 'alexs@numericable.fr', description: 'Great big house!')}
  
  it 'has an address' do
    expect(listing.address).to eq('alexs@numericable.fr')
  end

  it 'has a description' do
    expect(listing.description).to eq('Great big house!') 
  end

  describe '.create' do
    it 'create and save new database listing' do
      test_listing = Listing.create(address: 'alexs@numericable.fr', description: 'Great big house!')
      expect(test_listing).to be_a Listing
      expect(test_listing.address).to eq('alexs@numericable.fr')
      expect(test_listing.description).to eq('Great big house!')
      expect(test_listing.id).to eq("1")
      expect(DatabaseConnection.query("SELECT address FROM listings WHERE id=1;").first['address']).to eq('alexs@numericable.fr')
    end
  end
end