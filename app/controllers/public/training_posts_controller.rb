class Public::TrainingPostsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @training_posts = current_customer.training_posts
    @training_post_all = TrainingPost.all
    @customer = current_customer
  end

  def show
    @training_post = TrainingPost.find(params[:id])
    @customer = @training_post.customer
  end

  def new
    @training_post = TrainingPost.new
  end

  def create
    @training_post = TrainingPost.new(training_post_params)
    @training_post.customer = current_customer

    if @training_post.save
      redirect_to @training_post, notice: 'トレーニング投稿が作成されました。'
    else
      render :new
    end
  end

  def user_posts
    @customer = current_customer
    @training_posts = @customer.training_posts
  end

  private

  def training_post_params
    params.require(:training_post).permit(:title, :content, :date)
  end
end
