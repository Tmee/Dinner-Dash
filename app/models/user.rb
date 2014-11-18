class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, length: {minimum: 2, maximum: 32,
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }
end
