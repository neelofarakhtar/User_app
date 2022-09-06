class CommentsController < ApplicationController
   def new
    @comment = Comment.new
  end
    def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    @comment.user_id =current_user.id
    redirect_to  post_path(@post)
  end

  def destroy
  end

private
    def comment_params
      params.require(:comment).permit(:content,:post_id,:user_id)
    end
end
