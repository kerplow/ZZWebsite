class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, uniqueness: { scope: [:first_name, :last_name] }
  validates :email, uniqueness: true
  validate :act_as_legal
  validates_uniqueness_of :phone_number

  enum house_status: [ :pet, :housemate, :subrenter, :old_mate ]

  if self.is_admin
    enum act_as: { guest: 0, user: 1, admin: 2 }
  else
    enum act_as: { guest: 0, user: 1 }
  end

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
    when :housemate
      validates_presence_of :room
    when :subrenter
      validates_presence_of :room
    else
      errors.add(:guest, "guests have no room") if !room.blank?
    end
  end

  def act_as_legal
    unless is_admin
      errors.add(:status, "you're not an admin! sneaky sneaky!") unless act_as.in? [nil, :guest, :user]
    end
  end
end
