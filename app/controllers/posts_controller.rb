class PostsController < ApplicationController
  before_action :require_login

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to user_path(params[:user_id])
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to user_path(params[:user_id])
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
