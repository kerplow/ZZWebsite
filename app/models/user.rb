class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_voter

  validates :nickname, uniqueness: { scope: [:first_name, :last_name] }
  validates :email, uniqueness: true
  validates_uniqueness_of :phone_number, allow_blank: true, allow_nil: true

  HOUSE_STATUS = {housemate: 'housemate', subrenter: 'subrenter', old_housemate: 'old_housemate', house_pet: 'house_pet'}

  enum house_status: HOUSE_STATUS

  validates_presence_of :first_name

  has_many :debtors, through: :debts, source: :debtor
  has_many :debts, foreign_key:  'from_id', class_name: 'Debt'

  has_many :inners, through: :innings, source: :inner
  has_many :innings, foreign_key: 'to_id', class_name: 'Debt'

  has_many :notes

  has_one :room, inverse_of: :current_tenant, foreign_key: :current_tenant_id, dependent: :nullify
  after_update -> { self.room&.touch }

  validate :room_check

  def room_id=(id)
    self.room = Room.find(id)
  end

  def room_id
    self.room&.id
  end

  def room_check
    case house_status
    when "housemate"
      if room
        errors.add(:room, 'already has an owner') if room.owner and room.owner != self
      else
        errors.add(:room, 'is necessary for housemates')
      end
    when "subrenter"
      if room
        errors.add(:room, 'is being rented already') if room.owner and room.owner != self
      else
        errors.add(:room, 'is necessary for subrenters')
      end
    when "guest"
      errors.add(:room, "guests have no room") unless room.blank?
    end
  end

  def name
    self.nickname || self.first_name
  end
end
