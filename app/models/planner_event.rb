class PlannerEvent < ApplicationRecord
  include Tradeable
  acts_as_votable

  belongs_to :user, optional: true

  validates :user, presence: { message: 'private events need a verified user' }, unless: "is_public"
end
