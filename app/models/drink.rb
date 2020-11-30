class Drink < ActiveRecord::Base
  validates_presence_of :name, :instructions 

  belongs_to :user
end