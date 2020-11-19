class TopsController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result.order(created_at: :DESC).page(params[:page]).per(20)
  end
end
