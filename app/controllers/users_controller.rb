class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all.order('created_at DESC')
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
  
    if @user.save
      @user.create_profile(name: 'John Smith', age: 13)
      session[:current_user_id] = @user.id
      redirect_to users_path, notice: 'Account creation successful!'
    else
      redirect_to users_path, notice: 'Something went wrong! Please follow the error messages.'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:current_user_id] = nil

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
