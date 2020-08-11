require 'pg'

class Listing
attr_reader :address, :description, :id

def initialize(id:, address:, description:)
  @id = id
  @address = address
  @description = description
end

def self.create(address:, description:)
  result = DatabaseConnection.query("INSERT INTO listings (address, description) VALUES ('#{address}', '#{description}') 
  RETURNING *;")
  Listing.new(id: result[0]['id'], address: result[0]['address'], description: result[0]['description'])
end

end