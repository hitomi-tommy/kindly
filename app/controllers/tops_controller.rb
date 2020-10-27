class TopsController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result.order(created_at: :DESC)
  end
end
