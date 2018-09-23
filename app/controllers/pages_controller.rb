class PagesController < ApplicationController
  def home
    @user = current_user
    @events = PlannerEvent.all
    @notes = Note.all
    @event = PlannerEvent.new
  end

  def tikkie

  end
end
