class OptionsController < ApplicationController

  before_action :set_list, except: [:update, :edit, :destroy]
  before_action :set_option, only: [:update, :edit, :destroy]

  def create
    @option = @list.options.build(option_params)
    @option.user = current_user
    @option.save
  end

  def new
    @option = @list.options.build
  end

  def update
    @option.update(option_params)
  end

  def edit
  end

  def destroy
    @option.destroy
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_option
    @option = Option.find(params[:id])
  end

  def option_params
    params.require(:option).permit(:name)
  end
end
