class VotesController < ApplicationController
  before_action :set_and_authorize_model

  def upvote
    if @model.voters.include?(current_user.id)
      @model.un_liked_by(current_user)
      p @model.errors.full_messages
      @unvoted = true
    else
      @model.liked_by current_user
      p @model.errors.full_messages
    end
  end

  def downvote
    if @model.down_voters.include?(current_user.id)
      @model.un_disliked_by current_user
      p @model.errors.full_messages
      @unvoted = true
    else
      @model.disliked_by current_user
      p @model.errors.full_messages
    end
  end

  private

  def set_and_authorize_model
    @model = params[:voteable].constantize.find(params[:id])
    @html_id = "#{params[:voteable].downcase}-#{params[:id]}"
  end
end
