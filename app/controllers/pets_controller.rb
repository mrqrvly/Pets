#  PETS CONTROLLER
#  ===============

class PetsController < ApplicationController
  get '/?' do
    erb :results
  end
end
