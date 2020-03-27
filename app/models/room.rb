class Room < ApplicationRecord

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  belongs_to :current_tenant, class_name: "user", foreign_key: :current_tenant_id

  validates :number, presence: true, uniqueness: true, inclusion: 1..32
  # validates :owner, presence: true, uniqueness: true
  # validates :current_tenant, presence: true

end
