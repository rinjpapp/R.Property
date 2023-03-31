class BuildingsController < ApplicationController
  before_action :access_only_admin

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      flash[:success] = "商品を登録しました"
      redirect_to root_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
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
      :story, :image).merge(admin_id: current_admin.id)
  end
end
