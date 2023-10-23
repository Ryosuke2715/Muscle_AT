class Public::TrainingPostsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @training_posts = current_customer.training_posts
    @training_post_all = TrainingPost.all
    @customer = current_customer
  end

  def show
    @training_post = TrainingPost.find(params[:id])
    @training_menus = @training_post.training_menus
    @training_tags = @training_post.training_tags
    @customer = @training_post.customer
  end

  def new
    @training_tags = TrainingTag.all
    @training_post = TrainingPost.new
    @training_post.training_menus.build
  end

  def create
    @training_post = TrainingPost.new(training_post_params)
    @training_post.customer = current_customer

    if @training_post.save
      #TrainingMenu.new(training_post_id:@training_post.id, training_tag_id:training_post_params[:training_tag], kg:training_post_params[:kg], rep:training_post_params[:rep], set:training_post_params[:set])
      redirect_to @training_post, notice: 'トレーニング投稿が作成されました。'
    else
      @training_tags = TrainingTag.all
      render :new
    end
  end

  def user_posts
    @customer = current_customer
    @training_posts = @customer.training_posts
  end

  def destroy
    @training_post = TrainingPost.find(params[:id])
    if @training_post.customer == current_customer
      @training_post.destroy
      redirect_to public_training_posts_path, notice: 'トレーニング投稿が削除されました。'
    else
      redirect_to public_training_posts_path, alert: '他のカスタマーの投稿は削除できません。'
    end
  end

  private

  def training_post_params
    params.require(:training_post).permit(:title, :content, :date, training_menus_attributes: [:kg, :rep, :set, :training_tag_id])
  end
end
