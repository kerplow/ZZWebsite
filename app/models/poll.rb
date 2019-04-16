class Poll < ApplicationRecord
  has_many :voteables
  has_many :choices, through: :voteables, source: :choice, source_type: 'Option'
  has_many :choices, through: :voteables, source: :choice, source_type: 'PlannerEvent'
  has_many :choices, through: :voteables, source: :choice, source_type: 'Notes'
  belongs_to :list, optional: true

  def winner
    choices.order(:votes, :desc).first
  end

  def results
    includes(:choices).order(:votes, :desc)
  end

  def choices_from_list
    byebug
    list.options.each do |option|
      choices << option
    end
  end
end
