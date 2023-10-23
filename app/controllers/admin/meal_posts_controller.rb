class Admin::MealPostsController < ApplicationController

  def index
    @meal_posts = MealPost.all
  end
  
  def show
    @meal_post = MealPost.find(params[:id])
  end

  def destroy
    @meal_post = MealPost.find(params[:id])
    if @Meal_post.destroy
      flash[:notice] = "Meal post deleted successfully."
    else
      flash[:alert] = "Failed to delete the Meal post."
    end
    redirect_to admin_Meal_posts_path
  end
end
