class Organization::VolunteersController < Organization::BaseController
  def index
    @volunteers = current_user.organization.volunteers
  end
end
