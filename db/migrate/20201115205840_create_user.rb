class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |profile|
      profile.string :username
      profile.string :password
    end       
  end

end
