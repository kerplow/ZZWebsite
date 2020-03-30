class List < ApplicationRecord

  belongs_to :user
  belongs_to :list
  has_many :options

  validates :title, presence: true

  serialize :allowed_voters, Array

  scope :only_public, -> { where(is_public: true) }
  # scope :with_options, -> { includes(:options) }

  def winner
    options.sort_by(&:vote_total).first
  end
end
