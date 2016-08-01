class HomeController < ApplicationController
  get '/?' do
    erb :home
  end

  # post '/?' do
  #   # Creates a new user
  #   user = User.find_by username: params['username']

  #   if (params['username'] == '') || (params['password'] == '') || (params['firstname'] == '') || (params['lastname'] == '') || (params['zipcode'] == '')
  #     @sign_message = "please complete all fields!"
  #     erb :home
  #   elsif user
  #     @sign_message = "That username already exists!"
  #     erb :home
  #   else
  #     password = BCrypt::Password.create(params['password'])
  #     user = User.create username: params['username'], password: password, firstname: params['firstname'], lastname: params['lastname'], zipcode: params['zipcode']
  #     erb :user
  #   end
  # end


  post '/?' do
    user = User.find_by username: params['username']
    if (params['username'] == '') || (params['password'] == '')
      @log_message = "please complete all fields!"
      erb :home
    elsif !user
      @log_message = "that username doesn't exist!"
      erb :home
    elsif user
      password = BCrypt::Password.new(user.password)
      if password == params['password']
        erb :user, :locals => {:name => params['firstname']}
      else
        @log_message = "Incorrect Password"
        erb :home
      end
    end
  end





end
