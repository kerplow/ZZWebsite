class Option < ApplicationRecord
  acts_as_votable

  belongs_to :user
  belongs_to :list

  validates :name, presence: true, uniqueness: { scope: :list, message: "already on the list" }
  serialize :voters, Array

  belongs_to :polleable, polymorphic: true

  def allow_anonymous?
    list.allow_anonymous?
  end
end
