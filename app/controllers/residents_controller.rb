class ResidentsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :authenticate_admin!, only: :lists

  def index
  end

  def lists
    @user = User.where(status_id: 2)
  end


  private

  def authenticate_user!
    if user_signed_in?
      if current_user.status_id != 2 && current_user.status_id ==3
        redirect_to user_applicants_path(current_user.id)
      end
    else
      redirect_to root_path
    end
  end

  def authenticate_admin!
    unless admin_signed_in?
      redirect_to root_path
    end
  end
end
