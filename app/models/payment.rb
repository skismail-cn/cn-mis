class Payment < ActiveRecord::Base

	default_scope {order('created_at DESC')}
	belongs_to :project
	validates :payment_date, :payment_desc, :presence=>true
	validates :payment_amount, :presence=>true, :numericality =>true, :length => 1..15, allow_blank: false

	before_save :validate_foreign_key

	private
	def validate_foreign_key
		if self.project.nil?
			errors.add(:base , 'invalid project id')
			false
		end
	end

end
