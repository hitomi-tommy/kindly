class LikesController < ApplicationController
  def create
    like = current_user.likes.create(item_id: params[:item_id])
    redirect_to items_url, notice: "#{like.item.user.name}さんの投稿をお気に入り登録しました"
  end
  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to items_url, notice: "#{like.item.user.name}さんの投稿をお気に入り解除しました"
  end
end
