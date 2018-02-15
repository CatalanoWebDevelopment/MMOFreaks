class User < ActiveRecord::Base
    has_many :builds
    has_many :comments
    has_secure_password
    
    validates :email, presence: true
    validates :username, presence: true
    
    def slug
        username.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        User.all.find{|user| user.slug == slug}
    end
end