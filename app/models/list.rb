class List < ApplicationRecord
  acts_as_votable

  belongs_to :user
  belongs_to :list
  has_many :options

  validates :title, presence: true

  serialize :allowed_voters, Array

  scope :all_public, -> { where(is_public: true) }

  scope :with_options, -> { includes(:options) }
end
