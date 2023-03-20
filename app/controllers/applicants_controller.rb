class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_only_applicant

  def index
  end

  private 

  def user_only_applicant
    if current_user.status_id != 3 && current_user.status_id == 2
      redirect_to residents_path
    end
  end
end
