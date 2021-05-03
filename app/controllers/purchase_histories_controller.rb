class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  before_action :redirect_to_root_path

  def index
    @purchase_history_address = PurchaseHistoryAddress.new
  end

  def create
    @purchase_history_address = PurchaseHistoryAddress.new(purchase_history_address_params)
    if @purchase_history_address.valid?
       pay_item
       @purchase_history_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_history_address_params
    params.require(:purchase_history_address).permit(:post_code, :city, :house_number, :phone_number,
      :building_name, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_history_address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def redirect_to_root_path
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.purchase_history != nil
      redirect_to root_path
    end
  end
end
