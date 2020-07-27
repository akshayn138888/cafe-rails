class Course < ApplicationRecord
  belongs_to :categori
  
  has_many :features 
  has_many :daily_menus, through: :features, source: :daily_menu
  
  validate :check
  
  private
  def check 
    # daily_menus.count == 0
    return unless daily_menus.count == 0
    errors.add(:daily_menus, "Cannot delete beause it belongs to at least one daily manu") if daily.menus.count == 0
  end 
end
