class VolunteersController < ApplicationController
	
   
	 def new
    @volunteer = Volunteer.new
  end

  def create
    volunteer = Volunteer.create(volunteer_params)
    flash[:success] = 'Thank you for joining us. Organization will shortly contact you.'
    redirect_to root_path
  end

  private
  def volunteer_params
    params.require(:volunteer).permit(:first_name, :last_name, :email, :phone_no, :profession, :why_you_joining, :time_contribution, :organization_id)
  end

end
