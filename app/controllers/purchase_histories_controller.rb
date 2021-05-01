class PurchaseHistoriesController < ApplicationController

  def index
    @purchase_histories = PurchaseHistory.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_histories = PurchaseHistory.new(purchase_histories_params)
    # if @purchase_histories.save
    #   redirect_to root_path
    # else
    #   render :index
    # end
  end

  private

  # def purchase_histories_params
  #   params.require(:purchase_histories).merge(user_id: current_user.id, item_id: params[:item_id])
  # end
end
