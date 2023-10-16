class Public::TrainingPostsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  # トレーニング投稿一覧ページ
  def index
    @training_posts = current_customer.training_posts
    @training_post_all = TrainingPost.all
  end

  # トレーニング投稿詳細ページ
  def show
    @training_post = TrainingPost.find(params[:id])
  end

  # トレーニング投稿作成ページ
  def new
    @training_post = TrainingPost.new
  end

  # トレーニング投稿作成処理
  def create
    @training_post = TrainingPost.new(training_post_params)
    @training_post.customer = current_customer

    if @training_post.save
      redirect_to @training_post, notice: 'トレーニング投稿が作成されました。'
    else
      render :new
    end
  end

  # 他のアクション（編集、更新、削除など）も追加できます
  def user_posts
    @customer = current_customer
    @training_posts = @customer.training_posts
  end

  private

  def training_post_params
    params.require(:training_post).permit(:title, :content, :date)
  end
end
