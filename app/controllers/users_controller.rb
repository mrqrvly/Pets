class UsersController < ApplicationController

  # GET - /users/:id - individual user
  get '/:id/?' do |id|
    user = User.find id

    if user
      # erb :user
      user.to_json
    else
      { status: 'error', message: 'No user with that ID' }.to_json
    end
  end


  # PATCH - /users/:id
  patch '/:id/?' do |id|
    user = User.find id

    user.update username: params['username'] || user.username, password: params['email'] || user.password, firstname: params['firstname'] || user.firstname, lastname: params['lastname'] || user.lastname

    { status: 'ok', message: 'user updated' }.to_json 
  end


  # DELETE - /users/:id
  delete '/:id/?' do |id|
    user = User.find id

    if user
      user.destroy
      { status: 'ok', message: 'User deleted' }.to_json
    else
      { status: 'error', message: 'Cannot delete user' }.to_json
    end
  end

   # GET - /users/
  get '/?' do
    users = User.all

    if users
      users.to_json
    else
      { status: 'error', message: 'No users found' }.to_json
    end
  end
end
