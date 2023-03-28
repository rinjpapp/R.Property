class HomesController < ApplicationController
  before_action :set_ransack, only: [:index, :search]

  def index
  end

  def show
  end

  def search
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
