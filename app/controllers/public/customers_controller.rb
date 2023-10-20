class Public::CustomersController < ApplicationController
  # ログイン済みのユーザーのみアクセス可
  before_action :authenticate_customer!
  before_action :set_customer, only: [:show, :edit, :update]


  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @training_posts = @customer.training_posts
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "プロフィールが更新されました。"
      redirect_to customer_path # 更新成功時にプロフィールページにリダイレクト
    else
      flash[:alert] = "プロフィールの更新に失敗しました。"
      render :edit # 更新失敗時に編集ページに戻る
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def currect_customer
    unless current_customer == @customer
      redirect_to root_url, alert: "他のユーザーのプロフィールは編集できません。"
    end
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :profile_message)
  end
end