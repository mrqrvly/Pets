#  PETS CONTROLLER
#  ===============

require 'httparty'
require 'json'
require 'geocoder'

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

    @zipCoord = Geocoder.coordinates(@zip)
    @zipLat = @zipCoord[0]
    @zipLng = @zipCoord[1]

   
    result  = HTTParty.get("http://api.petfinder.com/pet.find?key=61635e39395ce71e4d0eba82c79adb55&location=#{@zip}&animal=#{@animal}&breed=#{@breed}&count=9&format=json").parsed_response
    
    @petArray = []

    for pet in result["petfinder"]["pets"]["pet"] do
      puts "=============================================================="

      pet = {"name"=>pet["name"]["$t"],
             "animal"=>pet["animal"]["$t"],
             "breed"=>@breed,
             "description"=>pet["description"]["$t"],
             "phone"=>pet["contact"]["phone"]["$t"],
             "email"=>pet["contact"]["email"]["$t"],
             "address"=>pet["contact"]["address1"]["$t"],
             "city"=>pet["contact"]["city"]["$t"],
             "state"=>pet["contact"]["state"]["$t"],
             "zip"=>pet["contact"]["zip"]["$t"]
            }

      @petArray.push(pet).to_json


      puts "=============================================================="
    end
    puts @petArray.push(pet).to_json
    # puts petArray[i]["name"]


    @addressArray = []
    @nameArray = []
    @metaArray = []

    @petArray.each do |i|
      address = i["address"]
      city = i["city"]
      state = i["state"]
      zip = i["zip"]
      name = i["name"]
      
      @nameArray.push("#{name}")

      @addressArray.push("#{address} #{city} #{state} #{zip}")



    end

     
     # puts @metaArray

    erb :results
  end

end
