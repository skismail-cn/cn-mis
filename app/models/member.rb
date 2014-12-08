class Member < ActiveRecord::Base
  belongs_to :designation
  belongs_to :department
  belongs_to :location

  validates :Name, :presence =>true, :uniqueness =>true, :length =>{:in => 5..20}
  validates :Email, :presence =>true, :uniqueness =>true
  validates :Joining_Date,:Salary,:Password,:Confirm_Password, :presence=>true
  validates_length_of :Password, :in => 6..20, :on => :create
end
