require 'pry'

class Klass < ActiveRecord::Base
    has_many :builds
    has_many :karacters, through: :builds
    
    validates :name, presence: true
    
    def readable_skills
        
        left_bracket_delete = self.skills.gsub("[", "")
        right_bracket_delete = left_bracket_delete.gsub("]", "")
        delete_quotes = right_bracket_delete.gsub(/"/, "")
        to_array = delete_quotes.split(",")
        
    end
        
end