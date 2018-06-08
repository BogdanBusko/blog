class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    puts "Search ---------------------- #{params[:search]}"

    @posts = Post.search(params[:search]).page(params[:page]).per(25)
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @post.update_attributes(post_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @post.delete
    flash[:success] = 'Post deleted!'
    redirect_to root_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text).merge(user_id: current_user.id)
  end
end
