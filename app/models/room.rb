class Room < ApplicationRecord
  validates :number, presence: true, uniqueness: true, inclusion: 1..32

  has_one :owner, -> { where('users.house_status = ?', 0) }, class_name: "User"
  has_one :renter, -> { where('users.house_status = ?', 1) }, class_name: "User"
  has_many :previous_tenants, -> { where('users.house_status = ?', 2) }, class_name: "User"

  def current_tenant
    renter ? renter : owner
  end
end
