class User < ActiveRecord::Base

	has_many :messages
	
	has_secure_password

	validates :first_name, presence: true
	validates :last_name, presence: true
  	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  	validates :password, presence: true, length: { in: 6..20 }
end
