class ListsController < ApplicationController
  before_action :set_and_authorize_list, only: [:show, :update, :edit, :destroy]

  def new
    @list = List.new
    @list.user = current_user
    authorize @list
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @list.user = current_user
    authorize @list

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
        format.js
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        authorize @list
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_and_authorize_list
      @list = List.find(params[:id])
      authorize @list
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title, :user_id, :description, :poll, :is_public, :private, options: {})
    end
end
