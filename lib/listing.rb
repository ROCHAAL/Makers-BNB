require 'pg'
require_relative "user"

class Listing
attr_reader :address, :description, :id, :available_dates, :price_per_night, :user_id

  def initialize(id:, address:, description:, available_dates:, price_per_night:, user_id:)
    @id = id
    @address = address
    @description = description
    @available_dates = available_dates
    @price_per_night = price_per_night
    @user_id = user_id
  end

  def self.create(address:, description:, available_dates:, price_per_night:,  user_id:)
    result = DatabaseConnection.query("INSERT INTO listings (address, description, available_dates, price_per_night, user_id) VALUES ('#{address}', '#{description}', '#{available_dates}', '#{price_per_night}', '#{user_id}')
    RETURNING *;")
    Listing.new(id: result[0]['id'], address: result[0]['address'], description: result[0]['description'], available_dates: result[0]['available_dates'], price_per_night: result[0]['price_per_night'], user_id: result[0]['user_id'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM listings;")
    result.map do |listing|
      Listing.new(id: listing['id'], address: listing['address'], description: listing['description'], available_dates: listing['available_dates'], price_per_night: listing['price_per_night'], user_id: listing['user_id'])
    end
  end

  def username 
    User.find(@user_id).username
  end

  def email
    User.find(@user_id).email
  end
end
