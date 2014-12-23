class Portfolio < ActiveRecord::Base

	self.per_page = 5
	default_scope {order('created_at DESC')}

	belongs_to :projecttype
	belongs_to :project

	validates :project_id,:presence =>true,:uniqueness =>true
	validates :project_url,:project_caption,:presence =>true, :uniqueness =>true, :length =>{:in => 5..100}
	validates :projecttype_id,:presence =>true

	before_save :validate_foreign_keys

	private

	def validate_foreign_keys
		if self.project.nil?
			errors.add(:base, 'invalid project id')
			false
		end
		if self.projecttype.nil?
			errors.add(:base, 'invalid project type')
			false
		end
	end

	def self.as_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |item|
				csv << item.attributes.values_at(*column_names)
			end
		end
	end
end
