#  PETS CONTROLLER
#  ===============

class PetsController < ApplicationController

  get '/petprofile/?' do
    erb :pet
  end

  get '/?' do
   
  end

  post '/?' do
    @animal = params[:animal]
    @breed  = params[:breed]
    @zip    = params[:zip]
    
    def index
      @pets

    erb :results
  end

end
