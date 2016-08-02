#  PETS CONTROLLER
#  ===============

class PetsController < ApplicationController

  get '/petprofile/?' do
    
  end

  get '/?' do
    # erb :results
  end

  post '/?' do
    @animal = params[:animal]
    @breed  = params[:breed]
    @zip    = params[:zip]
    erb :results
  end

end
