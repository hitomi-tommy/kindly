class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(params.require(:item).permit(:name, :description, :images, :budget, :deadline, :status))
    redirect_to items_path
  end
end
