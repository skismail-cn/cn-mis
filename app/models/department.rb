class Department < ActiveRecord::Base
	has_many :designations, dependent: :destroy
	has_many :members, dependent: :destroy
	validates :name, :presence => true, :uniqueness => true, :length => { :in => 5..20 }
	#validates :status, :presence => true, :default=>true

	self.per_page = 5
	
	def self.as_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |item|
				csv << item.attributes.values_at(*column_names)
			end
		end
	end
end
