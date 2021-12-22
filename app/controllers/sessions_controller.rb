class SessionsController < ApplicationController
  def new
  end

  def create
    current_user = User.find_by(:username)

    if current_user && current_user.authenticate(:password)
      sessions[:current_user_id] = current_user.id
      redirect_to users_path, notice: 'Login successful!'
    else
      flash[:error] = 'There is an invalid username or password.'
      render :new
    end
  end

  def destroy
  end
end
