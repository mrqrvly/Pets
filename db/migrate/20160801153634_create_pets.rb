#  SCHEMA FOR PETS RECORD
#  USERS WILL SAVE THESE FROM SEARCH RESULTS
#  =========================================

class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.string :breed
      t.string :address
      t.string :organization
      t.string :phone
      t.string :website
      t.string :description
      t.string :userid
    end
  end
end
