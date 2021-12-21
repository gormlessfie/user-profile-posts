class PostsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user)
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
