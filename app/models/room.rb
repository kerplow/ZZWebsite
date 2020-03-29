class Room < ApplicationRecord

  belongs_to :owner         , optional: true, class_name: "User", foreign_key: :owner_id
  belongs_to :current_tenant, optional: true, class_name: "user", foreign_key: :current_tenant_id

  has_many :room_tasks, dependent: :nullify

  after_touch :update_tenant_name

  validates :number, presence: true, uniqueness: true, inclusion: 1..31
  # validates :owner, presence: true, uniqueness: true
  # validates :current_tenant, presence: true
  def update_tenant_name
    self.update( tenant_name: current_tenant ? current_tenant.first_name : owner ? owner.first_name : self.tenant_name )
  end
end
