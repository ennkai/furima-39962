class RecordsController < ApplicationController

  def index
    @record_form = RecordForm.new
  end

  def create
    @record_form = RecordForm.new(record_params)
    if @record_form.save
      redirect_to root_path
    else
      render :create, status: :unprocessable_entity
    end

  end

  private

  def record_params
    params.require(:record_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


end
