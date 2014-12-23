class Leave < ActiveRecord::Base

  self.per_page = 5
  default_scope {order('created_at DESC')}
  
  belongs_to :member
  belongs_to :leavetype
  belongs_to :leavedaytype
  belongs_to :leavestatus

  validates :member_id,:leavetype_id,:leavedaytype_id,:leavestatus_id,:leave_start_date,
  :leave_end_date,:reason_for_leave, :presence =>true

  validates :contact_number, :presence=>true, :numericality =>true, :length => 8..10, allow_blank: false

  before_save :validate_foreign_key

  private

  def validate_foreign_key
  	if self.member.nil?
  		error.add(:base, 'invalid member selected')
  		false
  	end
  	if self.leavetype.nil?
  		error.add(:base, 'invalid leave type selected')
  		false
  	end
  	if self.leavedaytype.nil?
  		error.add(:base, 'invalid leave day type selected')
  		false
  	end
  	if self.leavestatus.nil?
  		error.add(:base, 'invalid leave status selected')
  		false
  	end
  end
end
