module ApplicationHelper
  def get_country_names
    ISO3166::Country.all.map{|c| [c.name, c.name]}
  end

  def get_organization_for_select
    Organization.all.map{|o| [o.name, o.id]}
  end
end
