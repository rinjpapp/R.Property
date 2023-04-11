class FavoritesController < ApplicationController
  before_action :room_find

  def create
    Favorite.create(user_id: current_user.id, room_id: params[:id])
    render 'create.js.erb'
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, room_id: params[:id])
    favorite.destroy
    render 'destroy.js.erb'
  end

  private

  def room_find
    @room = Room.find(params[:id])
  end
end
