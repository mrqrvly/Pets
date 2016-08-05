#  PETS CONTROLLER
#  ===============

require 'httparty'
require 'json'

class PetsController < ApplicationController

  

  #  POST - /pets/petprofile/ - Allows access to a single result of Ajax request
  #  -------------------------------------------------------------------------
  post '/petsave/?' do
    # pet = Pet.create name: 
    @pet = params[:petdata]
    puts params
    
    erb :pet


  end

  

  #  POST - /pets/ - Renders Ajax search results and map
  #                  sets params for us in Ajax request
  #  ---------------------------------------------------
  post '/?' do
    
    @animal = params[:animal]
    @breed  = params[:breed]
    @zip    = params[:zip]
    
    result  = HTTParty.get("http://api.petfinder.com/pet.find?key=61635e39395ce71e4d0eba82c79adb55&location=#{@zip}&animal=#{@animal}&breed=#{@breed}&count=21&format=json").parsed_response
    
    @petArray = []

    for animal in result["petfinder"]["pets"]["pet"] do
      pet = {"name"        =>animal["name"]["$t"],
             "animal"      =>animal["animal"]["$t"],
             "breed"       =>@breed,
             "description" =>animal["description"]["$t"],
             "phone"       =>animal["contact"]["phone"]["$t"],
             "email"       =>animal["contact"]["email"]["$t"],
             "address"     =>animal["contact"]["address1"]["$t"],
             "city"        =>animal["contact"]["city"]["$t"],
             "state"       =>animal["contact"]["state"]["$t"],
             "zip"         =>animal["contact"]["zip"]["$t"],
             "picsmall"    =>animal["media"]["photos"]["photo"][1]["$t"],
             "petid"       =>animal["id"]["$t"]
             # "piclarge"    =>animal["media"]["photos"]["photo"][3]["$t"]
            }

    # if animal["media"]["photos"]["photo"][1]["$t"]
    #   pet[:picsmall] = animal["media"]["photos"]["photo"][1]["$t"]
    # else
    #   pet[:picsmall] = "No Photo"
    # end

    # if animal["media"]["photos"]["photo"][2]["$t"]
    #   pet[:piclarge] = animal["media"]["photos"]["photo"][2]["$t"]
    # else
    #   pet[:piclarge] = "No Photo"
    # end
      @petArray.push(pet)
    
      puts "================"
      puts pet
    end

    erb :results
  end

end
