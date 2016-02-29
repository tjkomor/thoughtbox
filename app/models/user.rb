class User < ActiveRecord::Base
  has_secure_password
  validates :email, :username, :password, presence: true
  validates :email, confirmation: true, uniqueness: true
end
