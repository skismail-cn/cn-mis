class Leavetype < ActiveRecord::Base

	self.per_page = 3

	has_many :leaves, dependent: :restrict_with_error
	
	validates :name,:presence=>true

	def self.as_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |item|
				csv << item.attributes.values_at(*column_names)
			end
		end
	end
end
