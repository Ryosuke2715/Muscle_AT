class Public::MealFavsController < ApplicationController
  def index
    @meal_fav = MealFav.where(customer_id: current_customer.id)
  end
  
  def create
    meal_post = MealPost.find(params[:meal_post_id])
    favorite = current_customer.meal_fav.new(meal_post_id: meal_post.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    meal_post = MealPost.find(params[:meal_post_id])
    favorite = current_customer.meal_fav.find_by(meal_post_id: meal_post.id)
    favorite.destroy
    redirect_to request.referer
  end
end
