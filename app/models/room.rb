class Room < ApplicationRecord

  belongs_to :owner         , optional: true, class_name: "User", foreign_key: :owner_id
  belongs_to :current_tenant, optional: true, class_name: "user", foreign_key: :current_tenant_id

  has_many :room_tasks, dependent: :nullify

  validates :number, presence: true, uniqueness: true, inclusion: 1..31
  # validates :owner, presence: true, uniqueness: true
  # validates :current_tenant, presence: true

end
