class ParticipantsController < ApplicationController
	before_action :set_event , only: [:new,:destroy, :create]

def new

  @Ievent=Event.find(params[:event_id])
  @participant=Participant.new
end
   
def create
   @participant=Participant.new(participant_params)
   @participant.event_id = params[:event_id] 
  
   respond_to do |format|
     
      if @participant.save
        format.html { redirect_to (@participant.event), notice: 'Thankyou! will contact you soon' }
        format.json { render :show, status: :created, location: @participant }
      else
<<<<<<< HEAD
        format.html { render :new }
=======
        format.html { redirect_to (@participant.event), notice: ''  }
>>>>>>> sub
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
end
end
  def destroy
  @Ievent = Event.find(params[:event_id])
  @participant = Participant.find(params[:id])
  @participant.destroy
  redirect_to event_path(@Ievent)
 end
private
def set_event
      @Ievent = Event.find(params[:event_id])
end

def participant_params
        params.require(:participant).permit(:event_id,:name,:address,:phone)
end
end
