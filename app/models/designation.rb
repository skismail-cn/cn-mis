class Designation < ActiveRecord::Base
  belongs_to :department
  has_many :members, dependent: :destroy
  validates :name, :presence => true, :length => { :in => 5..20 }

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
