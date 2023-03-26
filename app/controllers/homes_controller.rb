class HomesController < ApplicationController

  def index
  end

  def show
  end

  def search
    @q = Room.includes(:building).ransack(params[:q])
    @rooms = @q.result
  end
end
