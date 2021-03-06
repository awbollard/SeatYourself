class Restaurant < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :reservations
  has_many :users, through: :reservations
  validates :opening_time, :closing_time, presence: true
end
