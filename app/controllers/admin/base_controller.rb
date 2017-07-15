class Admin::BaseControllerController < ApplicationController
	before_action :validate_admin

 protected
  def validate_admin
    unless current_user.present? && current_user.admin?
      flash[:alert] = "You don't have access for this section."
     redirect_to root_path
   end
  end
end
