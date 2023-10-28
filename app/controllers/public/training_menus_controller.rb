class Public::TrainingMenusController < ApplicationController
  def create
    # ストロングパラメータを使用してパラメータを取得
    training_menu_params = params.require(:training_menu).permit(:kg, :rep, :set)

    # ログイン中のユーザーを取得
    customer = current_customer

    # トレーニングメニューを作成
    training_menu = TrainingMenu.create(training_menu_params)

    # トレーニングメニューとトレーニング投稿を関連付ける
    training_post = TrainingPost.create(customer: customer)
    training_post.training_menus << training_menu

    # 成功時のリダイレクトやフラッシュメッセージ

  end
end
