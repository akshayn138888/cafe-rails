class Categori < ApplicationRecord
    has_many :courses
    
    validate :check
    
    
    private
    
    def check 
        courses.count == 0
    end 
    
    
end
