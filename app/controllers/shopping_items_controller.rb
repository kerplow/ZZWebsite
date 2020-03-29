class ShoppingItemsController < ApplicationController

  before_action :set_shopping_list, except: [:update, :edit, :destroy]
  before_action :set_shopping_item, only: [:update, :edit, :destroy]

  def create
    @shopping_item = @shopping_list.shopping_items.build(shopping_item_params)
    @shopping_item.user = current_user
    @shopping_item.save
  end

  def new
    @shopping_item = @shopping_list.shopping_items.build
  end

  def update
    @shopping_item.update(shopping_item_params)
  end

  def edit
  end

  def destroy
    @shopping_item.destroy
  end

  private

    def set_shopping_list
      @shopping_list = ShoppingList.find(params[:shopping_list_id])
    end

    def set_shopping_item
      @shopping_item = ShoppingItem.find(params[:id])
    end

    def shopping_item_params
      params.require(:shopping_item).permit(:item, :price)
    end
end
