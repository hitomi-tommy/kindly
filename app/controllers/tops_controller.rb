class TopsController < ApplicationController
  def index
    # @items = Item.all
    @q = Item.ransack(params[:q])
    @items = @q.result
  end
end
