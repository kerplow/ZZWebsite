class PlannerEventsController < ApplicationController
  def new

  end

  def create
    @event = PlannerEvent.new(event_params)
    if @event.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'pages/home' }
        format.js  # <-- idem
      end
    end
  end

  def update
  end

  def edit
  end

  def show
  end

  def index
  end

  def destroy
  end

  private

  def event_params
    params.require(:planner_event).permit(:name, :description, :start_time, :end_time)
  end
end
