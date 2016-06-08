class Item < ActiveRecord::Base
	belongs_to :user

	#a method to display how much days are left on a created item in the to-do list
	def days_left
		7 - (DateTime.now.to_date - created_at.to_date).to_i 
	end
end
