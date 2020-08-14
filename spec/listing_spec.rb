require 'listing'

describe Listing do
  let(:listing) {Listing.new(id: 1, address: 'alexs@numericable.fr', description: 'Great big house!', available_dates: "now", price_per_night: "1", booking_status: 'available', user_id: 1)}
  let(:user) {double(:user)}

  it 'has an address' do
    expect(listing.address).to eq('alexs@numericable.fr')
  end

  it 'has a description' do
    expect(listing.description).to eq('Great big house!')
  end

  describe '.create' do
    it 'create and save new database listing' do
      User.create(username: "test", password: "testpassword", email: "test@test.com")
      test_listing = Listing.create(address: 'alexs@numericable.fr', description: 'Great big house!', available_dates: "now", price_per_night: "1", user_id: 1)
      expect(test_listing).to be_a Listing
      expect(test_listing.address).to eq('alexs@numericable.fr')
      expect(test_listing.description).to eq('Great big house!')
      expect(test_listing.id).to eq("1")
      expect(DatabaseConnection.query("SELECT address FROM listings WHERE id=1;").first['address']).to eq('alexs@numericable.fr')
    end
  end

  describe '.all' do
    it 'lists all listings from the database' do
      User.create(username: "test", password: "testpassword", email: "test@test.com")
      Listing.create(address: 'alexs@numericable.fr', description: 'Great big house!', available_dates: "now", price_per_night: "1", user_id: 1)
      Listing.create(address: 'test@test.com', description: 'this is a test!', available_dates: "now", price_per_night: "1", user_id: 1)
      expect(Listing.all.length).to eq 2
      expect(Listing.all).to be_a Array
      expect(Listing.all.first).to be_a Listing
      expect(Listing.all.first.address).to eq 'alexs@numericable.fr'
      expect(Listing.all.first.description).to eq 'Great big house!'
      expect(Listing.all.last.address).to eq 'test@test.com'
    end
  end

  describe '#booking_status' do 
    it 'reads the booking_status from the table' do
      create_user_and_listing
      expect(listing.booking_status).to eq 'available'
    end
  end 

  describe '#request_booking' do 
    it 'changes the booking_status to pending' do
      create_user_and_listing
      listing.request_booking
      expect(listing.booking_status).to eq 'pending'
    end
  end

  describe '#approve_booking_request' do
    it 'changes booking_status to booked' do
      create_user_and_listing
      listing.request_booking
      listing.approve_booking_request
      expect(listing.booking_status).to eq 'booked'
    end
  end

  describe '.available_listings' do 
    it 'lists only the available listings' do 
      create_user_and_listing
      listing = Listing.create(address: 'test2', description: 'test2', available_dates: "now", price_per_night: "1", user_id: 1)
      listing.request_booking
      listing.approve_booking_request
      expect(Listing.available_listings).to be_a Array
      expect(Listing.available_listings.length).to eq 1
    end
  end

  describe '.my_listings' do
    it 'lists only listings posted by a specific user' do 
      create_user_and_listing
      User.create(username: "test2", password: "testpassword", email: "test2@test.com")
      Listing.create(address: 'test2', description: 'test2', available_dates: "now", price_per_night: "1", user_id: 2)
      expect(Listing.my_listings('1')).to be_a Array
      expect(Listing.my_listings('1').length).to eq 1
    end
  end
end
