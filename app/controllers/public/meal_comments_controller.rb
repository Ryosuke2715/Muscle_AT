class Public::MealCommentsController < ApplicationController
   before_action :authenticate_customer!

  def create
    @meal_post = MealPost.find(params[:meal_post_id])
    @comment = @meal_post.meal_comments.build(comment_params)
    @comment.customer = current_customer

    if @comment.save
      redirect_to @meal_post, notice: "コメントが追加されました"
    else
      redirect_to @meal_post, alert: "コメントを追加できませんでした"
    end
  end

  def destroy
    @meal_post = MealPost.find(params[:meal_post_id])
    @comment = @meal_post.meal_comments.find(params[:id])

    if @comment.customer == current_customer
      @comment.destroy
      redirect_to @meal_post, notice: "コメントが削除されました"
    else
      redirect_to @meal_post, alert: "コメントを削除できませんでした"
    end
  end

  private

  def comment_params
    params.require(:meal_comment).permit(:comment_content)
  end
end
