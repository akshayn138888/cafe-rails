class DailyMenusController < ApplicationController
  before_action :authenticate_user!, except: [:index] 
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
  
end
