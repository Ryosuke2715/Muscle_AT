class Admin::TrainingPostsController < ApplicationController

  def index
    @training_posts = TrainingPost.all
  end

  def show
    @training_post = TrainingPost.find(params[:id])
  end

  def destroy
    @training_post = TrainingPost.find(params[:id])
    if @training_post.destroy
      flash[:notice] = "Training post deleted successfully."
    else
      flash[:alert] = "Failed to delete the training post."
    end
    redirect_to admin_training_posts_path
  end
end
