class List < ApplicationRecord
  belongs_to :user
  has_many :options

  validates :title, presence: true

  serialize :allowed_voters, Array

  def initialize(params)
    if @casheable
      include 'casheable'

      has_one :debt
    end

    super params
  end
end