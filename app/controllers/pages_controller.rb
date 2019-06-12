require 'eetlijst_loader'

class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  after_action :verify_policy_scoped

  def home
    require 'csv'

    @user = current_user
    @events = policy_scope PlannerEvent
    @notes = policy_scope Note
    @cleaning_week = params[:cleaning_week] ? Date.parse(params[:cleaning_week]) : (Date.today.cwday - 1).days.ago
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
    @poll = Poll.new
  end
end
