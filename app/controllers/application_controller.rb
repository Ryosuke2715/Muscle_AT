class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search

  def after_sign_in_path_for(resource)
    customer_path(current_customer)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def search
    @result = params[:q]&.values&.reject(&:blank?)

    @q = TrainingPost.ransack(params[:q])
    @item_training = @q.result(distinct: true)

    @q_meal = MealPost.ransack(params[:q])
    @item_meal = @q_meal.result(distinct: true)
  end
end
