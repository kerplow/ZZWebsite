class LostAndFoundController < ApplicationController
  def index
    @lafitems = LostItem.all
    @newitem = LostItem.new



    # @lafitem = LostItem
  end

  def create
    @newitem = LostItem.new(lost_item_params)
    @newitem.save
    redirect_to lost_and_found_path(@newitem)
  end

  def update
  end

  def show
    @showitem = LostItem.find(params[:id])
  end

  def destroy
  end

  def lost_item_params
    params.require(:lost_item).permit(:name, :description)
  end

end
