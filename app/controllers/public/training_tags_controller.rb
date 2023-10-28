class Public::TrainingTagsController < ApplicationController
  def new
    @training_tag = TrainingTag.new
    @training_tags = TrainingTag.all
  end

  def create
    @training_tag = TrainingTag.new(training_tag_params)

    if @training_tag.save
      redirect_to new_training_tag_path, notice: 'トレーニングタグが作成されました。'
    else
      render :new
    end
  end
  
  private

  def training_tag_params
    params.require(:training_tag).permit(:training_tag)
  end
end
