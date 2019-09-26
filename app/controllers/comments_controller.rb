# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:alert] = @comment.errors.full_messages.to_sentence
      redirect_to post_path(@post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
