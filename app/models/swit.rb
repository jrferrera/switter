class Swit < ActiveRecord::Base
	belongs_to :user
	has_many :comment

	validates :content, :presence => true,
		:length => { minimum: 1, maximum: 140 },
		:uniqueness => { case_sensitive: false }
		
	def add_data(id, sweet, sour, tag)
		self.user_id = id
 		self.sweet = sweet
 		self.sour = sour
 		self.tag = tag;
	end
end
