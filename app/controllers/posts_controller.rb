class PostsController < ApplicationController

  def index
    @posts = Post.where(:user_id => current_user.id) rescue nil
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
     @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])

    if @post.update(posts_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
     @post = current_user.posts.create(posts_params)
      redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy 
    redirect_to post_path(@post)
  end

  def posts_params
    params.require(:post).permit(:content, :filename, :user_id)
  end

end
