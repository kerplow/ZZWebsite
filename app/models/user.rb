class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, uniqueness: { scope: [:first_name, :last_name] }
  validates :email, uniqueness: true
  validates_uniqueness_of :phone_number

  #validate presence, uniqueness and inclusion in (0-32) of room, unless it's a guest
  with_options unless: 'guest' do |housemate|
    housemate.validates :room, presence: true, uniqueness: true, inclusion: 1..32
  end

  validates_presence_of :first_name

  has_many :debtors, through: :debts, source: :debtor
  has_many :debts, foreign_key:  'from_id', class_name: 'Debt'

  has_many :inners, through: :innings, source: :inner
  has_many :innings, foreign_key: 'to_id', class_name: 'Debt'

  has_many :notes

  def room_check
    unless guest

    end
  end
end
