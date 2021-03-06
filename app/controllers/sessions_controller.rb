class SessionsController < ApplicationController
  def new
  end

  def create
    current_user = User.find_by(username:sessions_params[:username])

    if current_user && current_user.authenticate(sessions_params[:password])
      session[:current_user_id] = current_user.id
      redirect_to users_path, notice: 'Login successful!'
    else
      flash[:error] = 'There is an invalid username or password.'
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end

  private

  def sessions_params
    params.require(:user).permit(:username, :password)
  end
end
