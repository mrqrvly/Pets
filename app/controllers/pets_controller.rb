#  PETS CONTROLLER
#  ===============

require 'httparty'
require 'json'

class PetsController < ApplicationController

  #  GET - /pets/petprofile/ - Allows access to a single result of Ajax request
  #  -------------------------------------------------------------------------
  get '/petprofile/?' do
    
  end

  #  GET - /pets/ - Unused as of right now
  #  -------------------------------------
  get '/?' do
    # erb :results
  end


  #  POST - /pets/ - Renders Ajax search results and map
  #                  sets params for us in Ajax request
  #  ---------------------------------------------------
  post '/?' do
    
    @animal = params[:animal]
    @breed  = params[:breed]
    @zip    = params[:zip]
    puts "=============================================================="
    
    result  = HTTParty.get("http://api.petfinder.com/pet.find?key=61635e39395ce71e4d0eba82c79adb55&location=#{@zip}&animal=#{@animal}&breed=#{@breed}&count=1&format=json").parsed_response
    puts result["petfinder"]["pets"]["pet"]["name"]["$t"]
    
    # @result = HTTParty.get("http://api.petfinder.com/pet.find?key=61635e39395ce71e4d0eba82c79adb55&location=#{@zip}&animal=#{@animal}&breed=#{@breed}&count=1&format=json").parsed_response
    # thing = JSON.parse(result.body)

    erb :results
  end

end
