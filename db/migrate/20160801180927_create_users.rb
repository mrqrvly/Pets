#  SCHEMA FOR USER RECORDS
#  STORES INFO FOR REGISTERED USERS
#  ================================

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :firstname
      t.string :lastname
    end
  end
end
