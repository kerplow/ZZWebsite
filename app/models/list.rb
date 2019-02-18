class List < ApplicationRecord
  belongs_to :user
  has_many :options

  validates :title, presence: true

  serialize :allowed_voters, Array
end
