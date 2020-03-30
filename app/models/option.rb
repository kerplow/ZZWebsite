class Option < ApplicationRecord

  belongs_to :user
  belongs_to :list

  validates :name, presence: true, uniqueness: { scope: :list }
  serialize :voters, Array
  serialize :down_voters, Array

  def allow_anonymous?
    list.allow_anonymous?
  end

  def liked_by(user)
    self.voters << user.id
    self.down_voters.delete(user.id)
  end

  def un_liked_by(user)
    self.voters.delete(user.id)
  end

  def disliked_by(user)
    self.down_voters << user.id
    self.voters.delete(user.id)
  end

  def un_disliked_by(user)
    self.down_voters.delete(user.id)
  end

  def vote_total
    voters.count - (down_voters ? down_voters.count : 0)
  end
end
