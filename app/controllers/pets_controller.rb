#  PETS CONTROLLER
#  ===============

class PetsController < ApplicationController
  get '/?' do
    erb :pet
  end
end
