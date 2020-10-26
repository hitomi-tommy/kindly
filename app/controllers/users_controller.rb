class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: @user.id)
    @likes = Like.where(user_id: @user.id)
  end

end
