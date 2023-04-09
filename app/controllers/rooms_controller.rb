class RoomsController < ApplicationController
  before_action :access_only_admin, except: [:show]
  before_action :set_building, only: [:new, :create]
  before_action :set_ransack, only: :show

  def new
    @room = @building.rooms.build
  end

  def create
    @room = @building.rooms.build(room_params)
    if @room.save
      redirect_to building_room_path(@building.id, @room.id)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to building_room_path(@room.building.id, @room.id)
    else
      render :edit
    end
  end

  private

  def access_only_admin
    if admin_signed_in?
      authenticate_admin!
    else
      if user_signed_in?
        if current_user.status_id != 2 && current_user.status_id ==3 
          redirect_to applicants_path
        elsif current_user.status_id != 3 && current_user.status_id == 2
          redirect_to residents_path
        end
      else
        redirect_to root_path
      end
    end
  end

  def room_params
    params.require(:room).permit(:room_number, :rent, :management_fee, :deposit, :key_money, :layout, :floor_area,
                                 :available_date, :image).merge(admin_id: current_admin.id)
  end

  def set_building
    @building = Building.find_by(id: params[:building_id])
  end

    def set_ransack
    if params[:q]&.dig(:layout)
      squished_keywords = params[:q][:layout].squish
      params[:q][:layout_cont_any] = squished_keywords.split(" ")
    end
    @q = Room.includes(:building).ransack(params[:q])
    @rooms = @q.result
  end
end
