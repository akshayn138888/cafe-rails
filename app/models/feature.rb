class Feature < ApplicationRecord
  belongs_to :daily_menu
  belongs_to :course
  
  validates :course, uniqueness: { scope: :daily_menu }

end
