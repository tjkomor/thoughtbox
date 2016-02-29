class User < ActiveRecord::Base
  has_secure_password
  validates :email_address, :username, :password, presence: true
  validates :email_address, confirmation: true, uniqueness: true
end
