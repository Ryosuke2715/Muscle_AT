class Public::TrainingCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @training_post = TrainingPost.find(params[:training_post_id])
    @comment = @training_post.training_comments.build(comment_params)
    @comment.customer = current_customer

    if @comment.save
      redirect_to @training_post, notice: "コメントが追加されました"
    else
      redirect_to @training_post, alert: "コメントを追加できませんでした"
    end
  end

  def destroy
    @training_post = TrainingPost.find(params[:training_post_id])
    @comment = @training_post.training_comments.find(params[:id])

    if @comment.customer == current_customer
      @comment.destroy
      redirect_to @training_post, notice: "コメントが削除されました"
    else
      redirect_to @training_post, alert: "コメントを削除できませんでした"
    end
  end

  private

  def comment_params
    params.require(:training_comment).permit(:comment_content)
  end
end
