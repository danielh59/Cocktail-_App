class CreateDrink < ActiveRecord::Migration
  def change
    create_table :drinks do |d|
      d.string :name
      d.string :pic
      d.text :instructions
      d.integer :user_id
    end
  end
end
