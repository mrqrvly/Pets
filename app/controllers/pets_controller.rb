#  PETS CONTROLLER
#  ===============

class PetsController < ApplicationController

  get '/petprofile/?' do
    erb :pet
  end

  post '/?' do
   
  end


  get '/' do
    erb :results
  end

end
