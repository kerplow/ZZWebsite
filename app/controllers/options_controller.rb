class OptionsController < ApplicationController
  before_action :set_and_authorize_list, only: [:new, :create]
  before_action :set_and_authorize_option, only: [:update, :destroy]

  def new
    @option = @list.options.build

    respond_to do |format|
      format.js
    end
  end
  # POST /options
  # POST /options.json
  def create
    @option = @list.options.build(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to @option, notice: 'option was successfully created.' }
        format.json { render :show, status: :created, location: @option }
        format.js
      else
        format.html { render :new }
        format.json { render json: @option.errors, status: :unprocessable_entity }
        format.js { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /options/1
  # PATCH/PUT /options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.js
      else
        format.js
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    def set_and_authorize_list
      @list = List.includes(:options).find(params[:list_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_and_authorize_option
      set_and_authorize_list
      @option = @list.options.find { |o| o.id == params[:id].to_i }
      authorize @option
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_params
      params.require(:option).permit(:name).merge({ user: current_user })
    end
end
