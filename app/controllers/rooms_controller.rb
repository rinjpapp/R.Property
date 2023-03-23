class RoomsController < ApplicationController
  before_action :access_only_admin

  def new
    @room = Room.new
  end

  def create
    
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
end
