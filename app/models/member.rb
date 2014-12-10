class Member < ActiveRecord::Base
	attr_accessor :password
	self.per_page = 1

	belongs_to :designation
	belongs_to :department
	belongs_to :location

	validates :Name, :presence =>true, :uniqueness =>true, :length =>{:in => 5..20}
	validates :Email, :presence =>true, :uniqueness =>true
	validates :Joining_Date,:Salary,:department_id,:designation_id,:location_id, :presence=>true
	validates :password, :confirmation => true #password_confirmation attr
	validates_length_of :password, :in => 6..20, :on => :create

	before_save :encrypt_password
	after_save :clear_password

	def encrypt_password
		if password.present?
		self.salt = BCrypt::Engine.generate_salt
		self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
		end
	end
	def clear_password
		self.password = nil
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
