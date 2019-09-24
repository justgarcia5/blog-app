class PostsController < ApplicationController
  before_action :find_post, only: [:show, :destroy]

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

  def show
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Note was successfully deleted"
      redirect_to root_path
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
    if @post.nil?
      flash[:notice] = "Route does not exist. Please check your post route."
      redirect_to root_path
    end
  end

end
