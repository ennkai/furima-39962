class RecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @record_form = RecordForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @record_form = RecordForm.new(record_params.merge(item_id: @item.id))
    if @record_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def record_params
    params.require(:record_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


end


