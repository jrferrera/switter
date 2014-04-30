class Swit < ActiveRecord::Base
	belongs_to :user
	has_many :comment

	def add_data(id, sweet, sour, tag)
		self.user_id = id
 		self.sweet = sweet
 		self.sour = sour
 		self.tag = tag;
	end
end
