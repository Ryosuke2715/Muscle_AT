class Admin::MealCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @comment = MealComment.find(params[:id])
    @comment.destroy
    redirect_to admin_meal_post_path(@comment.meal_post), notice: "コメントが削除されました"
  end
end
