class VotesController < ApplicationController
  before_action :set_and_authorize_model

  def upvote
    if current_user.voted_up_on?(@model)
      @model.unliked_by current_user
      @unvoted = true
    else
      @model.liked_by current_user
    end
  end

  def downvote
    if current_user.voted_down_on?(@model)
      @model.undisliked_by current_user
      @unvoted = true
    else
      @model.disliked_by current_user
    end
  end

  private

  def set_and_authorize_model
    @model = params[:voteable].constantize.find(params[:id])
    @html_id = "#{params[:voteable].downcase}-#{params[:id]}"
  end
end
