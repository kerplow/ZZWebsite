require 'eetlijst_loader'

class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  before_filter :authenticate_user!

  def home
    @user = current_user
    @events = PlannerEvent.all
    @notes = Note.all
    @event = PlannerEvent.new
    @agent = EetlijstLoader::Page.get_agent
  end

  def tikkie
    @user = current_user
    @users = User.where.not(id: @user.id)
  end

  def lists
    @user = current_user
    @lists = policy_scope(List)
  end
end
