require "sinatra/base"
require "./lib/listing"
require "./lib/database_connection"
require "./database_setup"

class AirBnb < Sinatra::Base

  enable :sessions

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
    erb :'listings/new'
    # Creates new listings
  end

  post '/listings/new/' do
    Listing.create(address: params[:address], description: params[:description])
    redirect '/listings'
    # Saves the listing and redirects to list page
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/' do
    User.create(username: params[:username], password: params[:password], email: params[:email])
    redirect '/'
  end

  get '/sessions/destroy' do
    erb(:index)
  end

  run! if app_file == $0
end
