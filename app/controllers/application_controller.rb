class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception
 
    def after_sign_in_path_for(resource)
    return (resource.samaritan? ? root_path : dashboard_organization_organizations_path)
    if resource.samaritan?
      root_path
    elsif resource.organization?
      dashboard_organization_organizations_path
    else
      admin_dashboard_index_path
    end
   end
 end

