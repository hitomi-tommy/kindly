class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(item_id: params[:item_id])
    @item = @like.item
    @like.save
    item = Item.find(params[:item_id])
    #通知の作成
    item.create_notification_like!(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end

  def destroy
    @like = current_user.likes.find_by(item_id: params[:item_id])
    @item = @like.item
    @like.destroy
    item = Item.find(params[:item_id])
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end
end
