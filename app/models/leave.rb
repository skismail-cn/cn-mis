class Leave < ActiveRecord::Base

  self.per_page = 5
  
  belongs_to :member
  belongs_to :leavetype
  belongs_to :leavedaytype
  belongs_to :leavestatus

  validates :member_id,:leavetype_id,:leavedaytype_id,:leavestatus_id,:leave_start_date,
  :leave_end_date,:reason_for_leave, :presence =>true

  validates :contact_number, :presence=>true, :numericality =>true, :length => 8..10, allow_blank: false

end
