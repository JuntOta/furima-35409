class PurchaseHistoriesController < ApplicationController

  def index
    @purchase_history_address = PurchaseHistoryAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_address_params)
    if @purchase_history_address.save
      redirect_to root_path
    else
      render :index
    end
    # if @purchase_history_address.valid?
  end

  private

  def purchase_history_address_params
    params.require(:purchase_history_address).permit(:post_code, :city, :house_number, :phone_number,
      :building_name, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
