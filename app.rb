require "sinatra/base"
require 'sinatra/flash'
require "./lib/listing"
require "./lib/database_connection"
require "./lib/user"
require "./database_setup"

class AirBnb < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(session[:user_id])
    @list = Listing.my_pending_listings(session[:user_id])
    erb(:index)
    # Homepage
  end

  get '/listings' do
    @list = Listing.available_listings
    erb(:listings)
    # Displays all listings
  end

  get '/listings/new' do
    erb :'listings/new'
    # Creates new listings
  end

  post '/listings/new/' do
    Listing.create(address: params[:address], description: params[:description], available_dates: params[:available_dates], price_per_night: params[:price_per_night], user_id: session[:user_id])
    redirect '/listings'
    # Saves the listing and redirects to list page
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/bookings/new/:id' do
    @listing = Listing.find(params[:id])
    @listing.request_booking
    redirect '/listings'
  end

  post '/bookings/approve/:id' do
    @listing = Listing.find(params[:id])
    @listing.approve_booking_request
    redirect '/'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = 'Incorrect username or password, try again.'
      redirect '/sessions/new'
    end
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/users' do
    user = User.create(username: params[:username], password: params[:password], email: params[:email])

    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = 'An account already exists with this email or username.'
      redirect '/user/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/'
  end

  run! if app_file == $0
end
