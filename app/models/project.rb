class Project < ActiveRecord::Base
  belongs_to :projectstatus
  belongs_to :projecttype
  belongs_to :projectmode
  belongs_to :member
  belongs_to :depratment
  belongs_to :location

  has_many :payments, dependent: :destroy
end
