class EventsController < ApplicationController
layout "problem_post" , only: [:show, :index]
  def index
   @Ievents= Event.page(params[:page]).per(10)
  end
  def show
  @Ievent = Event.find(params[:id])
  @participant = Participant.new( :event_id => @Ievent_id )
  @participants = @Ievent.participants
end
end
