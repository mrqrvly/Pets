#  PETS CONTROLLER
#  ===============

class PetsController < ApplicationController

  get '/?' do
    erb :pet
  end

  post '/?' do
   
  end


 get '/results/?' do
  erb :results
end

end
