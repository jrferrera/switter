class User < ActiveRecord::Base
	has_secure_password

	validates :username, :presence => true,
		:length => { minimum: 6, maximum: 32 },
		:uniqueness => { case_sensitive: false }
	validates :password, :presence => true,
		:length => { minimum: 6, maximum: 32 }

	has_many :swit
	has_many :comment
end
