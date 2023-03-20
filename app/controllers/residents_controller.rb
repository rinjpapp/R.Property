class ResidentsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_only_resident

  def index
  end

  private

  def user_only_resident
    if current_user.status_id != 2 && current_user.status_id ==3
      redirect_to applicants_path
    end
  end
end
