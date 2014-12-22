class Payment < ActiveRecord::Base
  belongs_to :project
  validates :payment_date, :payment_desc, :presence=>true
  validates :payment_amount, :presence=>true, :numericality =>true, :length => 1..15, allow_blank: false
end
