class User < ActiveRecord::Base
    validates :username, :password, presence: true
    has_secure_password
    validates_uniqueness_of :username
    has_many :drinks
end
