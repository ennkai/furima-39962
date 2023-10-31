class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  


    private

    def item_params
      params.require(:item).permit(:title, :explanation, :price, :situation_id, :category_id, :delivery_id, :load_id, :prefecture_id, :image).merge(user_id: current_user.id)
    end



end
