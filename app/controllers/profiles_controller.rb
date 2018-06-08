class ProfilesController < ApplicationController
  def index
    @user = current_user
    @posts = Post.where(user_id: current_user.id).order_by(created_at: :desc).page(params[:page]).per(25)
  end

  def edit

  end

  def update

  end

  private

  def profile_params

  end
end
