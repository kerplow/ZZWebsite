class VotesController < ApplicationController
  before_action :set_and_authorize_model

  def upvote
    respond_to do |format|
      if @model.liked_by current_users
        format.js
      else
        format.js { flash[:notice] = 'vote not registered' }
      end
    end
  end

  def downvote
    respond_to do |format|
      if @model.downvote_from current_users
        format.js
      else
        format.js { flash[:notice] = 'vote not registered' }
      end
    end
  end

  private

  def set_and_authorize_model
    @model = vote_params[:model_type].constantize.find(vote_params[:model_id])
  end

  def vote_params
    params.require(:vote).permit(:user, :model_type, :model_id)
  end
end
