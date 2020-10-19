class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    # @items = Item.all
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if current_user.save && @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @like = current_user.likes.find_by(item_id: @item.id)
    @comments = @item.comments
    @comment = @item.comments.build
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
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to items_path, notice:"投稿を削除しました！"
    else
      flash.now[:error] = "削除できませんでした"
      redirect_to items_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, { images: [] }, :budget, :deadline, :status)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
