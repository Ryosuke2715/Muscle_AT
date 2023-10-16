class Public::MealPostsController < ApplicationController
  def index
    @meal_posts = MealPost.all
  end
  
  def new
    @meal_post = MealPost.new
  end
  
  def create
    @meal_post = MealPost.new(meal_post_params)
    if @meal_post.save
      redirect_to meal_posts_path
    else
      render :new
    end
  end
  
  def show
    @meal_post = MealPost.find(params[:id])
  end
  
  def edit
    @meal_post = MealPost.find(params[:id])
  end
  
  def update
    @meal_post = MealPost.find(params[:id])
    if @meal_post.update(meal_post_params)
      redirect_to meal_posts_path
    else
      render :edit
    end
  end
  
  def destroy
    @meal_post = MealPost.find(params[:id])
    @meal_post.destroy
    redirect_to meal_posts_path
  end
end
