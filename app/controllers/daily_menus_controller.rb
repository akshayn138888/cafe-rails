class DailyMenusController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!, only: [ :create, :edit, :update, :destroy]
  
  def index
    
  end
  
  
  def create
  end

  
  def edit
  end
  
  def update
  end

  def destroy
  end
  private
  def authorize! 
    @dailyMenu = DailyMenu.find(id)
    redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @dailyMenu)
  end
  
end
