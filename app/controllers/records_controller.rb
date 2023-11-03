class RecordsController < ApplicationController

  def index
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
    params.require(:record_form).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone, :token)
  end


end
