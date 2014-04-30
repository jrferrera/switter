class User < ActiveRecord::Base
	has_secure_password

	has_many :swit
	has_many :comment
end
