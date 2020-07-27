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
    @daily_menu = DailyMenu.new
    @feature = Feature.new
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
    @menu = DailyMenu.find_by_date(params[:daily_menu][:date])
    
   if @menu
    core =  Course.find_by_name(params[:daily_menu][:course])
  
    if @menu.featured_courses.where(id: core.id).exists?
      flash[:alert] = "already included in menu"
     
    else
     @menu.featured_courses << core
     featureUpdate      
    end 
   else
    @dailyMenu = DailyMenu.new(params.require(:daily_menu).permit(:date))
    @dailyMenu.user = current_user 
    @dailyMenu.featured_courses << Course.find_by_name(params[:daily_menu][:course])
   
   if @dailyMenu.save 
     featureUpdate 
    end      
  end 
   
     
    
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
  
  def featureUpdate
      x  =  Feature.last
      x.price= params[:daily_menu][:price]
      if params[:daily_menu][:portion] == "by-weight(100gm)"
       x.portion = true
      else
       x.portion = false
      end
      if x.save
       flash[:alert] = "Item added to the menu"
      end  
  
  end
  
end
