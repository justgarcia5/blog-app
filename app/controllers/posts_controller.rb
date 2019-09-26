# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
    @posts = Post.order(posts: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
    if @post.nil?
      flash[:notice] = 'Route does not exist. Please check your post route.'
      redirect_to root_path
    end
  end
end
