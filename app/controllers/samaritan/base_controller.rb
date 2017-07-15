class Samaritan::BaseControllerController < ApplicationController
before_action :validate_samaritan

  protected
  def validate_samaritan
    unless current_user.present? && current_user.samaritan?
      flash[:alert] = "You don't have access for this section."
      redirect_to root_path
    end
  end
end
