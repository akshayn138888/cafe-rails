class Course < ApplicationRecord
  belongs_to :categori
  
  has_many :features 
  has_many :daily_menus, through: :features, source: :daily_menu

end
