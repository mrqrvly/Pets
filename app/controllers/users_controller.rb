class UsersController < ApplicationController


# get '/logout/?'
#   session[:is_logged_in] = false
#   session[:user_id] = nil
#   erb :home
# end





   # GET - /users/
  get '/allusers?' do
    users = User.all

    if users
      users.to_json
    else
      { status: 'error', message: 'No users found' }.to_json
    end
  end


  post '/signup?' do
    # Creates a new user
    user = User.find_by username: params['username']

    if (params['username'] == '') || (params['password'] == '') || (params['firstname'] == '') || (params['lastname'] == '')
      @sign_message = "please complete all fields!"
      erb :home
    elsif user
      @sign_message = "That username already exists!"
      erb :home
    else
      password = BCrypt::Password.create(params['password'])
      user = User.create username: params['username'], password: password, firstname: params['firstname'], lastname: params['lastname']
      redirect '/profile'
    end
  end



  get '/profile/?' do
    # if session[:is_logged_in?] = true
      erb :user
    # else
    #   redirect '/'
    # end
  end


  post '/login?' do
    user = User.find_by username: params['username']
    if (params['username'] == '') || (params['password'] == '')
      @log_message = "Please complete all fields"
      erb :home
    elsif !user
      @log_message = "That username doesn't exist"
      erb :home
    elsif user
      password = BCrypt::Password.new(user.password)
      if password == params['password']
        # session[:is_logged_in?] = true
        # session[:user_id] = params[:user_id]
        redirect '/profile'
      else
        @log_message = "Incorrect Password"
        erb :home
      end
    end
  end


  get '/?' do
    erb :home
  end


end











#   # # PATCH - /users/:id
#   # patch '/:id/?' do |id|
#   #   user = User.find id

#   #   user.update username: params['username'] || user.username, password: params['email'] || user.password, firstname: params['firstname'] || user.firstname, lastname: params['lastname'] || user.lastname

#   #   { status: 'ok', message: 'user updated' }.to_json 
#   # end
