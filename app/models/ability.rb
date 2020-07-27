# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    
    can :manage, DailyMenu do |daily_menu|
      daily_menu.user == user 
    end 
    
  end
end
