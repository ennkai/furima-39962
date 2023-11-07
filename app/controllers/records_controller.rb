class RecordsController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @record_form = RecordForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @record_form = RecordForm.new(record_params)
    if @record_form.valid?
      pay_item
      @record_form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def record_params
    params.require(:record_form).permit(:token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end



end



