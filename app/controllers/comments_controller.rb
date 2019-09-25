class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
