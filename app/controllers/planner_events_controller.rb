class PlannerEventsController < ApplicationController
  before_action :load_and_authorize_event, only: [:show, :edit, :update, :destroy]
  def new

  end

  def create
    @event = PlannerEvent.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      else
        format.html { render 'pages/home' }
        format.js  # <-- idem
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to root_path }
        format.js
      else
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def edit
  end

  def show
  end

  def destroy
    respond_to do |format|
      if @event.destroy
        format.html { redirect_to root_path }
        format.js
      else
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private

  def load_and_authorize_event
    @event = PlannerEvent.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:planner_event).permit(:name, :description, :start_time, :end_time)
  end
end
