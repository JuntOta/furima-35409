class PurchaseHistoriesController < ApplicationController

  def index
    @purchase_history_address = PurchaseHistoryAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_address_params)
    @purchase_history_address.save #カード機能実装後に削除
    # if @purchase_history_address.valid? #カード機能実装後にコメントアウトを外す
    #    @purchase_history_address.save
    #   redirect_to root_path
    # else
    #   render :index
    # end
  end

  private

  def purchase_history_address_params
    params.require(:purchase_history_address).permit(:post_code, :city, :house_number, :phone_number,
      :building_name, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
