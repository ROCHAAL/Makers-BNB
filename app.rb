require "sinatra/base"
require "./lib/listing"
require "./lib/database_connection"
require "./database_setup"

class AirBnb < Sinatra::Base

  get '/' do
    erb(:index)
    # Homepage
  end

  get '/listings' do
    @list = Listing.all
    erb(:listings)
    # Displays all listings
  end

  get '/listings/new' do
    erb(:add_listing)
    # Creates new listings
  end

  post '/listings/new/' do
    Listing.create(address: params[:address], description: params[:description])
    redirect '/listings'
    # Saves the listing and redirects to list page
  end

  run! if app_file == $0
end