class Member < ActiveRecord::Base

	attr_accessor :password
	self.per_page = 3

	belongs_to :designation
	belongs_to :department
	belongs_to :location

	has_many :leaves, dependent: :restrict_with_error
	has_many :projects, dependent: :restrict_with_error

	#has_one :subordinates, class_name: "Member", foreign_key: "Reporting_To"
  	#belongs_to :superior, class_name: "Member", primary_key: "id", foreign_key: "Reporting_To"

	validates :Name, :presence =>true, :uniqueness =>false, :length =>{:in => 5..30}
	validates :Email, :presence =>true, :uniqueness =>true
	validates :Joining_Date,:Salary,:department_id,:designation_id,:location_id,:hot_Skills, :presence=>true
	validates :password, :confirmation => true #password_confirmation attr
	validates_length_of :password, :in => 6..20, :on => :create
	validates :Salary, :presence =>true, :numericality =>true, :length => 1..15

	before_save :encrypt_password,:validate_foreign_key
	after_save :clear_password

	private

	def encrypt_password
		if password.present?
		self.salt = BCrypt::Engine.generate_salt
		self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
		end
	end

	def validate_foreign_key
		self.Reporting_To && Member.exists?(:id => self.Reporting_To)
		if self.designation.nil?
			errors.add(:base, 'invalid designation')
			false
		end
		if self.department.nil?
			errors.add(:base, 'invalid department')
			false
		end
		if self.location.nil?
			errors.add(:base, 'invalid location')
			false
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
