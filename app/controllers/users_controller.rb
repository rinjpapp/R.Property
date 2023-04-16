class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if @user.status_id == 2
        redirect_to admin_residents_path
      else
        redirect_to admin_applicants_path
      end
    else
      render :edit
    end
  end

  def destory

  end

  private

  def user_params
    params.require(:user).permit(:status_id)
  end
end
