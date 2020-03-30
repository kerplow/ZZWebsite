require 'eetlijst_loader'

class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :about, :lists]

  before_action :set_opruimlijst, only: [:home, :lists, :corona]
  before_action :scope_noteboard, only: [:home, :lists, :corona]

  after_action :verify_policy_scoped, except: [:about]

  def home
    require 'csv'
    @user = current_user
    @events = policy_scope PlannerEvent
    @opruimlijst = Hash[CSV.read('lib/assets/opruimrooster.csv').collect { |row|  ["#{Date.parse(row[0])}", row[1..-1]] } ]
    # @agent = EetlijstLoader::Page.get_agent
  end

  def tikkie
    @user = current_user
    @users = User.where.not(id: @user.id)
    @to_me = Debt.to_user current_user
    @from_me = Debt.from_user current_user
    @pricetags = policy_scope Pricetag
  end

  def lists
    @user = current_user
    @lists = policy_scope(List)
    @notes = policy_scope Note
  end

  def about
  end

  def fuckshitup
    @roomtask = RoomTask.first
    if params[:doit]
      Object.send('remove_const', :RoomTask)
      CleaningTask.create(name: 'test', active: true)
      load 'app/models/room_task'
    end
    p @roomtask
    @roomtask.plop
    @second = RoomTask.last
    @second.plop
  end

  def corona
    @shopping_lists = policy_scope ShoppingList.order(planned_time: :desc)
    @corona_info = Note.corona
  end

  private

  def set_opruimlijst
    @active_tasks = CleaningTask.active
    @cleaning_week = params[:cleaning_week] ? CleaningWeek.full.for_week(params[:cleaning_week]) : CleaningWeek.full.for_date(Date.today)
    @next_week = @cleaning_week.next_week.full
    @previous_week = @cleaning_week.previous_week.full
  end

  def scope_noteboard
    @notes = policy_scope Note
  end
end
