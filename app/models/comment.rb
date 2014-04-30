class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :swit

	def add_data(user_id, swit_id)
		self.user_id = user_id
		self.swit_id = swit_id
	end
end
