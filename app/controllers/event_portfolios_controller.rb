class EventPortfoliosController < ApplicationController
 layout "problem_post", only: [:new,:create,:index,:show]
 before_action :validate_organization,only: [:new,:create]

  def index
   @events = EventPortfolio.page(params[:page]).per(10)
  end
  def show
   @event = EventPortfolio.find(params[:id])
  end
  def new
	@event=EventPortfolio.new
	end
	def create 
   @event=EventPortfolio.new(event_params)
   
  
   respond_to do |format|
     
      if @event.save
        format.html { redirect_to '/organizations/dashboard', notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
    end
     protected
  def validate_organization
    unless current_user.present? && current_user.organization?
      flash[:alert] = "Please login with valid NGO account."
      redirect_to root_path
    end
  end
private
def event_params
  params.require(:event_portfolio).permit(:event_name,:organization_name,:event_date ,:event_start,
  	:event_end,:event_loc,:coordinator_name,:description,:participants,:highlights,:avatar)
end

end
