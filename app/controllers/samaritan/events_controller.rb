class Samaritan::EventsController < ApplicationController
  layout "problem_post" 



 def new
    @event = current_user.events.new
  end

  def create
    event = current_user.events.create(events_params)
    flash[:success] = "Event successfully created."
    redirect_to root_path
  end

  private
  def events_params
    event = params[:event]
    time_string = event["scheduled_at(3i)"] +'-'+event["scheduled_at(2i)"]+'-'+event["scheduled_at(1i)"]+'|'+event["start_time(4i)"]+':'+event["start_time(5i)"]
    scheduled_at = DateTime.strptime(time_string, '%d-%m-%Y|%H:%M').ctime.in_time_zone
    params[:event][:scheduled_at] = scheduled_at
    params.require(:event).permit(:name, :scheduled_at, :duration, :location, :coordinator_name, :coordinator_email, :coordinator_phone, :moto, :who_can_participate, :event_cost)
  end
end
