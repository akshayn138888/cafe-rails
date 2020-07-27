class DailyMenusController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!, only: [ :show, :update, :destroy]
  
  def index
    @dailyMenus = DailyMenu.all
  end
  
  def show
    id = params[:id]
    @dailyMenu = DailyMenu.find(id)
    @attri =   @dailyMenu.features
    
    # @course = []
    # @categor = []
    # @attri.each do | bute |
    #   @course.push(bute.course.name)
    #   @categor.push(bute.course.categori.name)
    # end
  end
  
  def new 
    categor = Categori.all
    
    courses = Course.all
    
    @category = []
    @course = []
    
    categor.each do |cat|
      @category.push(cat.name)
    end 
    courses.each do |cor|
      @course.push(cor.name)
    end 

  end
  
  def create
    puts "hello"
  end

  
  def edit
  end
  
  def update
  end

  def destroy
  end
  private
  def authorize! 
    @dailyMenu = DailyMenu.find(params[ :id]) 
    redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @dailyMenu)
  end
  
end
