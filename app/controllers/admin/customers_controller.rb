class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  
  def show
    @customer = Customer.find(params[:id])
    @customer_posts = @customer.training_posts
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer.destroy
      flash[:notice] = "Training post deleted successfully."
    else
      flash[:alert] = "Failed to delete the training post."
    end
    redirect_to admin_customers_path
  end
end
