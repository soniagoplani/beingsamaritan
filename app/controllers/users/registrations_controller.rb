class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone_no, roles: []) }
  end

  # Build a devise resource passing in the session. Useful to move
  # temporary session data to the newly created user.
  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
    if params[:organization_name].present?
      self.resource.organization = Organization.new(name: params[:organization_name],
                                                    head_name: params[:head_name],
                                                    city: params[:city],
                                                    state: params[:state],
                                                    country: params[:country],
                                                    pin_code: params[:pin_code])

    end
    self.resource
  end

   def after_sign_up_path_for(resource)
     return (resource.samaritan? ? root_path : dashboard_organization_organizations_path)
  
    if resource.samaritan?
      root_path
    elsif resource.organization?
      dashboard_organization_organizations_path
    else
      admin_dashboard_index_path
    end
   end 
  def after_sign_out_path_for(resource)
    root_path
  end
end
