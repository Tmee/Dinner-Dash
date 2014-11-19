class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, length: {minimum: 2, maximum: 32,
    too_short: "must have at least %{count} letters",
    too_long: "must have at most %{count} letters"
  }

  def is_admin?
    self.roles.any? { |role| role.name == "admin"}
  end

  def is_webmaster?
    self.roles.any? { |role| role.name == "webmaster"}
  end 
end
