class Public::TrainingFavsController < ApplicationController
  def index
    @training_fav = TrainingFav.where(customer_id: current_customer.id)
  end
  
  def create
    training_post = TrainingPost.find(params[:training_post_id])
    favorite = current_customer.training_fav.new(training_post_id: training_post.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    training_post = TrainingPost.find(params[:training_post_id])
    favorite = current_customer.training_fav.find_by(training_post_id: training_post.id)
    favorite.destroy
    redirect_to request.referer
  end
end
