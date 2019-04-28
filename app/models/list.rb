class List < ApplicationRecord
  include Tradeable
  acts_as_votable

  belongs_to :user
  belongs_to :list
  has_many :options

  enum options_policy: { locked: 0, owner: 1, users: 2, everyone: 3 }

  validates :title, presence: true

  serialize :allowed_voters, Array
end
