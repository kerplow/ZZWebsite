class OpruimlijstController < ApplicationController
  def index
    @active_tasks = CleaningTask.active
    @cleaning_week = params[:cleaning_week] ? CleaningWeek.for_week(params[:cleaning_week]) : CleaningWeek.for_date(Date.today)
    @next_week = @cleaning_week.next_week
    @previous_week = @cleaning_week.previous_week
  end

  def edit
    @active_tasks = CleaningTask.active
    @cleaning_week = params[:cleaning_week] ? CleaningWeek.for_week(params[:cleaning_week]) : CleaningWeek.for_date(Date.today)
    @next_week = @cleaning_week.next_week
    @previous_week = @cleaning_week.previous_week
  end

  def switch
    @task1, @task2 = RoomTask.where(id: params[:task_ids])
    @task1, @task2 = @task1.room
    switch(@task2)
  end

  def assign

  end
end
