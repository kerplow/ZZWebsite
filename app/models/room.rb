class Room < ApplicationRecord
  validates :number, presence: true, uniqueness: true, inclusion: 1..32

  has_one :owner, class_name: "User"
  has_one :renter, class_name: "User"
end
