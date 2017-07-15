class Organization::BaseController < ApplicationController
  before_action :validate_organization
  
   
  protected
  def validate_organization
    unless current_user.present? && current_user.organization?
      flash[:alert] = "Please login with valid NGO account."
      redirect_to root_path
    end
  end
 
end
