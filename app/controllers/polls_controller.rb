class PollsController < ApplicationController

  def update
    @active = poll_params.delete(:active) == "1"
    set_poll
    @active ? archive : create
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll.archived = false

    respond_to do |format|
      if @poll.save
        format.json { render :show, status: :created, location: @poll }
        format.js
      else
        format.json { render json: @poll.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def archive
    @poll.archived = true
    @poll.save

    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      new_params = poll_params
      new_params[:list_id] = new_params.delete(:list).to_i
      @poll = !params[:id].nil? ? Poll.find(params[:id]) : Poll.new(new_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:list, :active)
    end
end
