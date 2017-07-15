class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  has_one :organization, dependent: :destroy, autosave: true
  has_many :events, dependent: :destroy
  ROLES = %w(Samaritan Organization Admin)

  def roles=(roles)
    self.roles_mask = self.class.get_roles_mask(roles)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

  def samaritan?
    has_role?('Samaritan')
  end

  def organization?
    has_role?('Organization')
  end

  def admin?
    has_role?('Admin')
  end

  private
  def self.get_roles_mask(roles)
    (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end
end