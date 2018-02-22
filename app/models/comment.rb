class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :build
    
    validates :content, presence: true
end