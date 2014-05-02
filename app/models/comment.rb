class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :swit

	validates :content, :presence => true,
		:length => { minimum: 1, maximum: 140 },
		:uniqueness => { case_sensitive: false }

	def add_data(user_id)
		self.user_id = user_id
	end
end
