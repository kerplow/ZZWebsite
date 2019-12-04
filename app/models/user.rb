class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, uniqueness: { scope: [:first_name, :last_name] }
  validates :email, uniqueness: true
  validates_uniqueness_of :phone_number

  HOUSE_STATUS = {housemate: 0, subrenter: 1, old_housemate: 2, guest: 3}

  enum house_status: HOUSE_STATUS

  validates_presence_of :first_name

  has_many :debtors, through: :debts, source: :debtor
  has_many :debts, foreign_key:  'from_id', class_name: 'Debt'

  has_many :inners, through: :innings, source: :inner
  has_many :innings, foreign_key: 'to_id', class_name: 'Debt'

  has_many :notes

  belongs_to :room, optional: true

  validate :room_check

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
        errors.add(:room, 'is being rented already') if room.owner.exists? and room.owner != self
      else
        errors.add(:room, 'is necessary for subrenters')
      end
    when "guest"
      errors.add(:room, "guests have no room") unless room.blank?
    end
  end
end
