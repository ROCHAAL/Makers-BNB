require 'pg'

class Listing
attr_reader :address, :description, :id, :user_id

  def initialize(id:, address:, description:, user_id:)
    @id = id
    @address = address
    @description = description
    @user_id = user_id
  end

  def self.create(address:, description:)
    result = DatabaseConnection.query("INSERT INTO listings (address, description) VALUES ('#{address}', '#{description}')
    RETURNING *;")
    Listing.new(id: result[0]['id'], address: result[0]['address'], description: result[0]['description'], user_id: result[0]['user_id'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM listings;")
    result.map do |listing|
      Listing.new(id: listing['id'], address: listing['address'], description: listing['description'], user_id: result[0]['user_id'])
    end
  end
end
