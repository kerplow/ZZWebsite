class List < ApplicationRecord
  include Tradeable
  acts_as_votable

  belongs_to :user
  belongs_to :list
  has_many :options

  validates :title, presence: true

  serialize :allowed_voters, Array
end
