class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice:"削除しました！"
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :images, :budget, :deadline, :status)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
