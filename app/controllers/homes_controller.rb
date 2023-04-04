class HomesController < ApplicationController
  before_action :set_ransack, only: [:index, :search]

  def index
  end

  def show
    
  end

  def search
    if params[:largest]
      @rooms = @q.result.largest
    elsif params[:smallest]
      @rooms = @q.result.smallest
    elsif params[:newest]
      @rooms = @q.result.includes(:building).newest
    elsif params[:oldest]
      @rooms = @q.result.includes(:building).oldest
    elsif params[:highest]
      @rooms = @q.result.highest
    elsif params[:lowest]
      @rooms = @q.result.lowest
    else
      @rooms = @q.result
    end
  end

  private

  def set_ransack
    if params[:q]&.dig(:layout)
      squished_keywords = params[:q][:layout].squish
      params[:q][:layout_cont_any] = squished_keywords.split(" ")
    end
    @q = Room.includes(:building).ransack(params[:q])
    @rooms = @q.result
  end
end
