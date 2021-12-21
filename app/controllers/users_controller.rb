class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all.order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  
    if @user.save
      @user.create_profile(name: 'John Smith', age: 13)
      redirect_to users_path, notice: 'Account creation successful!'
    else
      flash.now[:error] = 'Error! Unsuccessful!'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
