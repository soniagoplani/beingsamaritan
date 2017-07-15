class Volunteer::BaseController < ApplicationController
  before_action :validate_volunteer

  protected
  def validate_volunteer
    unless current_user.present? && current_user.volunteer?
      flash[:alert] = "Please login with valid volunteer account."
      redirect_to root_path
    end
  end
end
