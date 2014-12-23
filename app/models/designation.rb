class Designation < ActiveRecord::Base
  belongs_to :department
  has_many :members, dependent: :restrict_with_error
  validates :name, :presence => true, :length => { :in => 5..20 }

  self.per_page = 5

  before_save :validate_department

	def self.as_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |item|
				csv << item.attributes.values_at(*column_names)
			end
		end
	end

	private
	
	def validate_department
		if self.department.nil?
  		errors.add(:base, "Please select a valid department")
  		false
		end
	end
end
