require "sinatra/base"

class AirBnb < Sinatra::Base
  $listings = ["house 1", "house 2", "house 3"]

  get '/' do
    erb(:index)
  end

  get '/listings' do
    erb(:listings)
  end

  get '/listings/new' do
    erb(:add_listing)
  end

  post '/listings/new/' do
    @new_post = params[:listing]
    $listings.push(@new_post)
    redirect '/listings'
  end

  run! if app_file == $0
end