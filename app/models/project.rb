class Project < ActiveRecord::Base

  self.per_page = 5

  belongs_to :projectstatus
  belongs_to :projecttype
  belongs_to :projectmode
  belongs_to :member
  belongs_to :department
  belongs_to :location

  has_many :payments, dependent: :destroy
  has_one :portfolio, dependent: :destroy

  default_scope {order('created_at DESC')}

  before_save :validate_foreign_keys

  #self.start_date = self.created_at

  validates :client_name,:client_email,:bdm_name ,:start_date,:team_members,:projectstatus_id,:projecttype_id,:projectmode_id,:member_id,:department_id,:location_id, :presence =>true

  validates :name,:presence =>true, :uniqueness =>true, :length =>{:in => 5..100}
  validates :project_cost , :presence=>true, :numericality =>true, :length => 1..15, allow_blank: false

  def self.as_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |item|
				csv << item.attributes.values_at(*column_names)
			end
		end
	end

  private

  def validate_foreign_keys
    
    if self.projectstatus.nil?
      errors.add(:base, "Please select a valid member")
      false
    end
    if self.projecttype.nil?
      errors.add(:base, "Please select a valid project type")
      false
    end
    if self.projectmode.nil?
      errors.add(:base, "Please select a valid project mode")
      false
    end
    if self.member.nil?
      errors.add(:base, "Please select a valid member")
      false
    end
    if self.department.nil?
      errors.add(:base, "Please select a valid department")
      false
    end
    if self.location.nil?
      errors.add(:base, "Please select a valid location")
      false
    end
  end
end
