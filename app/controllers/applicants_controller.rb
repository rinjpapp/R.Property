class ApplicantsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  private 

  def authenticate_user!
    if user_signed_in?
      if current_user.status_id != 3 && current_user.status_id == 2
        redirect_to residents_path
      end
    else
      redirect_to root_path
    end
  end
end
