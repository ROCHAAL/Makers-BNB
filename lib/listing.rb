require 'pg'
require_relative "user"

class Listing
attr_reader :address, :description, :id, :user_id

  def initialize(id:, address:, description:, user_id:)
    @id = id
    @address = address
    @description = description
    @user_id = user_id
  end

  def self.user(user_id)
    User.find(user_id)
    #result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{user_id}';")
    #p result
    #User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.create(address:, description:, user_id:)
    result = DatabaseConnection.query("INSERT INTO listings (address, description, user_id) VALUES ('#{address}', '#{description}', '#{user_id}')
    RETURNING *;")
    Listing.new(id: result[0]['id'], address: result[0]['address'], description: result[0]['description'], user_id: result[0]['user_id'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM listings;")
    result.map do |listing|
      Listing.new(id: listing['id'], address: listing['address'], description: listing['description'], user_id: listing['user_id'])
    end
  end

  def username 
    User.find(@user_id).username
  end

  def email
    User.find(@user_id).email
  end
end
