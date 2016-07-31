require 'bundler'

Bundler.require :default, ENV['RACK_ENV'].to_sym

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'db.sqlite3'
)

require './app/models/user'
require './app/controllers/application_controller'
require './app/controllers/home_controller'
require './app/controllers/users_controller'
require './app/controllers/pets_controller'

map('/')      { run HomeController }
map('/users') { run UsersController }
map('/pets')  { run PetsController }
