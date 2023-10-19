class Admin::TrainingCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @comment = TrainingComment.find(params[:id])
    @comment.destroy
    redirect_to admin_training_post_path(@comment.training_post), notice: "コメントが削除されました"
  end
end
