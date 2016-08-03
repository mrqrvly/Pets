#  PETS CONTROLLER
#  ===============

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
<<<<<<< HEAD
    
    def index

=======
>>>>>>> master
    erb :results
  end

end
