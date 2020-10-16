class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :images, :budget, :deadline, :status)
  end
end