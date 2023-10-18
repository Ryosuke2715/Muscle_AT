class Public::CustomersController < ApplicationController
  # ログイン済みのユーザーのみアクセス可
  before_action :authenticate_customer!


  def index
    @customers = Customer.all
  end

  def show
    @customer = current_customer

  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "プロフィールが更新されました。"
      redirect_to customers_mypage_path # 更新成功時にプロフィールページにリダイレクト
    else
      flash[:alert] = "プロフィールの更新に失敗しました。"
      render :edit # 更新失敗時に編集ページに戻る
    end
  end

  private

  def correct_customer
    unless current_customer == @customer
      redirect_to root_url, alert: "他のユーザーのプロフィールは編集できません。"
    end
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :profile_message)
  end
end