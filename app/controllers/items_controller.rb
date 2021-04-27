class ItemsController < ApplicationController

  def index
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id, :item_condition_id, :postage_type_id,
    :prefecture_id, :preparation_day_id)
  end
end
