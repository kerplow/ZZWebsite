class List < ApplicationRecord
  belongs_to :user
  has_many :options

  validates :title, presence: true

  def winner
   options.order(votes: :desc).first
  end

  serialize :allowed_voters, Array
end
