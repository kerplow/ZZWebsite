class Room < ApplicationRecord

  has_one :owner, class_name: "User"
  has_one :current_tenant, class_name: "user"

  validates :number, presence: true, uniqueness: true, inclusion: 1..32
  # validates :owner, presence: true, uniqueness: true
  # validates :current_tenant, presence: true

end
