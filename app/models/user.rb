class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :assign_default_role

  def is_admin?
    has_role?(:admin)
  end

  def is_user?
    has_role?(:user)
  end

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

end
