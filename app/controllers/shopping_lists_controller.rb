class ShoppingListsController < ApplicationController
  before_action :set_and_authorize_shopping_list, only: [:show, :update, :edit, :destroy]

  def new
    @shopping_list = ShoppingList.new
  end

  # POST /shopping_lists
  # POST /shopping_lists.json
  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.user = current_user

    respond_to do |format|
      if @shopping_list.save
        format.html { redirect_to @shopping_list, notice: 'shopping_List was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_list }
        format.js
      else
        format.html { render :new }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
  end

  # PATCH/PUT /shopping_lists/1
  # PATCH/PUT /shopping_lists/1.json
  def update
    respond_to do |format|
      if @shopping_list.update(shopping_list_params)
        format.html { redirect_to @shopping_list, notice: 'shopping_List was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping_list }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /shopping_lists/1
  # DELETE /shopping_lists/1.json
  def destroy
    @shopping_list.destroy
    respond_to do |format|
      format.html { redirect_to shopping_lists_url, notice: 'shopping_List was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_and_authorize_shopping_list
      @shopping_list = ShoppingList.find(params[:id])
      authorize @shopping_list
    end

    # Never trust parameters from the scary internet, only allow the white shopping_list through.
    def shopping_list_params
      params.require(:shopping_list).permit(:name, :user_id, :description, :planned_time)
    end
end
