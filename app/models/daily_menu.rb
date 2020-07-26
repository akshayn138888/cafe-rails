class DailyMenu < ApplicationRecord
    
    has_many :features
    has_many :featured_courses, through: :features, source: :course
    
end
