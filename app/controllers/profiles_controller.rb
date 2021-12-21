class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def edit
    @profile = User.find(params[:user_id]).profile
  end

  def update
    @profile = User.find(params[:user_id]).profile

    if @profile.update(profile_params)
      redirect_to user_profile_path(params[:user_id], params[:id])
    else
      render :edit
    end
  end

  def profile_params
    params.require(:profile).permit(:age, :name)
  end
end
