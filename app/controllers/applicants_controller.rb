class ApplicantsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :authenticate_admin!, only: :lists

  def index
    user = User.find_by(id: params[:user_id])
    @user_favorites = user.favorites
  end

  def lists
    @user = User.where(status_id: 3)
  end

  private 

  def authenticate_user!
    if user_signed_in?
      if current_user.status_id != 3 && current_user.status_id == 2
        redirect_to user_residents_path(current_user.id)
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
