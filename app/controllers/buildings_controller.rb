class BuildingsController < ApplicationController
  before_action :access_only_admin

  def new
    @building = Building.new
    @rooms = @building.rooms.build
  end

  def create
    @building = Building.new(building_params)
    @building.rooms.each { |room| room.admin = current_admin }
    if @building.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    @building.rooms.each { |room| room.admin = current_admin }
    if @building.update(building_params)
      redirect_to home_path(@building.id)
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

  def building_params
    params.require(:building).permit(:building_name, :post_code, :prefecture_id, :city, :address, :access, :build_year,
      :story, :image, rooms_attributes: [:id, :room_number, :rent, :management_fee, :deposit, :key_money, :layout, :floor_area, :available_date, :image, :_destroy]).merge(admin_id: current_admin.id)
  end
end
