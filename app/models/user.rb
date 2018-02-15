class User < ActiveRecord::Base
    has_many :builds
    has_secure_password
    
    validates :email, presence: true
    validates :username, presence: true
end