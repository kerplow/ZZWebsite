class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
    @user = current_user
    @events = PlannerEvent.all
    @notes = Note.all
    @event = PlannerEvent.new
  end

  def tikkie
    @user = current_user
    @users = User.where.not(@user.id)
  end
end
